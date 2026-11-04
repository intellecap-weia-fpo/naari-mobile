import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Enum for sync operation types
enum SyncOperationType {
  submitSurvey,
  saveAnswer,
  uploadSignature,
  uploadPhoto,
}

/// Enum for sync status
enum SyncStatus { pending, syncing, completed, failed }

/// Enum for offline submission status
enum OfflineSubmissionStatus {
  draft, // User started but not submitted - can resume
  pendingSync, // User submitted but not synced to server
  synced, // Successfully synced to server
}

/// Human-readable log entry for sync attempts.
class SyncLogEntry {
  final int? id;
  final String operationType;
  final SyncStatus status;
  final String message;
  final String? localId;
  final String? surveyId;
  final String? questionId;
  final String? serverSubmissionId;
  final DateTime createdAt;

  SyncLogEntry({
    this.id,
    required this.operationType,
    required this.status,
    required this.message,
    this.localId,
    this.surveyId,
    this.questionId,
    this.serverSubmissionId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'operation_type': operationType,
      'status': status.name,
      'message': message,
      'local_id': localId,
      'survey_id': surveyId,
      'question_id': questionId,
      'server_submission_id': serverSubmissionId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory SyncLogEntry.fromMap(Map<String, dynamic> map) {
    return SyncLogEntry(
      id: map['id'] as int?,
      operationType: map['operation_type'] as String,
      status: SyncStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => SyncStatus.pending,
      ),
      message: map['message'] as String,
      localId: map['local_id'] as String?,
      surveyId: map['survey_id'] as String?,
      questionId: map['question_id'] as String?,
      serverSubmissionId: map['server_submission_id'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}

/// Model for offline sync queue item
class SyncQueueItem {
  final int? id;
  final SyncOperationType operationType;
  final String dataJson;
  final SyncStatus status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime? lastAttemptAt;
  final String? errorMessage;
  final int priority; // Lower number = higher priority

  SyncQueueItem({
    this.id,
    required this.operationType,
    required this.dataJson,
    this.status = SyncStatus.pending,
    this.retryCount = 0,
    DateTime? createdAt,
    this.lastAttemptAt,
    this.errorMessage,
    this.priority = 10,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> get data => jsonDecode(dataJson);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'operation_type': operationType.name,
      'data_json': dataJson,
      'status': status.name,
      'retry_count': retryCount,
      'created_at': createdAt.toIso8601String(),
      'last_attempt_at': lastAttemptAt?.toIso8601String(),
      'error_message': errorMessage,
      'priority': priority,
    };
  }

  factory SyncQueueItem.fromMap(Map<String, dynamic> map) {
    return SyncQueueItem(
      id: map['id'] as int?,
      operationType: SyncOperationType.values.firstWhere(
        (e) => e.name == map['operation_type'],
        orElse: () => SyncOperationType.submitSurvey,
      ),
      dataJson: map['data_json'] as String,
      status: SyncStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => SyncStatus.pending,
      ),
      retryCount: map['retry_count'] as int? ?? 0,
      createdAt: DateTime.parse(map['created_at'] as String),
      lastAttemptAt: map['last_attempt_at'] != null
          ? DateTime.parse(map['last_attempt_at'] as String)
          : null,
      errorMessage: map['error_message'] as String?,
      priority: map['priority'] as int? ?? 10,
    );
  }

  SyncQueueItem copyWith({
    int? id,
    SyncOperationType? operationType,
    String? dataJson,
    SyncStatus? status,
    int? retryCount,
    DateTime? createdAt,
    DateTime? lastAttemptAt,
    String? errorMessage,
    int? priority,
  }) {
    return SyncQueueItem(
      id: id ?? this.id,
      operationType: operationType ?? this.operationType,
      dataJson: dataJson ?? this.dataJson,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      errorMessage: errorMessage ?? this.errorMessage,
      priority: priority ?? this.priority,
    );
  }
}

/// Model for cached survey data
class CachedSurvey {
  final String id;
  final String surveyJson;
  final String? language;
  final DateTime cachedAt;
  final DateTime? expiresAt;

  /// The survey's server-side updatedAt timestamp for version tracking
  /// Used to detect conflicts when syncing offline submissions
  final DateTime? surveyUpdatedAt;

  CachedSurvey({
    required this.id,
    required this.surveyJson,
    this.language,
    DateTime? cachedAt,
    this.expiresAt,
    this.surveyUpdatedAt,
  }) : cachedAt = cachedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'survey_json': surveyJson,
      'language':
          language ?? '', // Use empty string for null to match DB schema
      'cached_at': cachedAt.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'survey_updated_at': surveyUpdatedAt?.toIso8601String(),
    };
  }

  factory CachedSurvey.fromMap(Map<String, dynamic> map) {
    final lang = map['language'] as String?;
    return CachedSurvey(
      id: map['id'] as String,
      surveyJson: map['survey_json'] as String,
      // Convert empty string back to null for consistency in app code
      language: (lang != null && lang.isNotEmpty) ? lang : null,
      cachedAt: DateTime.parse(map['cached_at'] as String),
      expiresAt: map['expires_at'] != null
          ? DateTime.parse(map['expires_at'] as String)
          : null,
      surveyUpdatedAt: map['survey_updated_at'] != null
          ? DateTime.parse(map['survey_updated_at'] as String)
          : null,
    );
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}

/// Model for offline submission draft
class OfflineSubmission {
  final String localId;
  final String surveyId;
  final String answersJson;
  final String? language;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? serverSubmissionId; // Set when synced

  /// The survey version (updatedAt timestamp) used when creating this submission
  /// Used for conflict detection during sync
  final DateTime? surveyVersionUsed;

  /// Status of the offline submission
  /// - draft: User started but not submitted - can resume
  /// - pendingSync: User submitted but not synced to server
  /// - synced: Successfully synced to server
  final OfflineSubmissionStatus status;

  /// The last question group index the user was on (for resuming drafts)
  final int? lastGroupIndex;

  OfflineSubmission({
    required this.localId,
    required this.surveyId,
    required this.answersJson,
    this.language,
    this.latitude,
    this.longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.serverSubmissionId,
    this.surveyVersionUsed,
    this.status = OfflineSubmissionStatus.pendingSync,
    this.lastGroupIndex,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> get answers => jsonDecode(answersJson);

  int get answerCount {
    try {
      final decoded = jsonDecode(answersJson);
      if (decoded is Map) return decoded.length;
      if (decoded is List) return decoded.length;
    } catch (e) {
      debugPrint('OfflineSubmission: Failed to count answers: $e');
    }
    return 0;
  }

  /// Check if this is a draft that can be resumed
  bool get isDraft => status == OfflineSubmissionStatus.draft;

  /// Check if this submission is pending sync
  bool get isPendingSync => status == OfflineSubmissionStatus.pendingSync;

  /// Check if this submission has been synced
  bool get isSynced => status == OfflineSubmissionStatus.synced;

  Map<String, dynamic> toMap() {
    return {
      'local_id': localId,
      'survey_id': surveyId,
      'answers_json': answersJson,
      'language': language,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'server_submission_id': serverSubmissionId,
      'survey_version_used': surveyVersionUsed?.toIso8601String(),
      'status': status.name,
      'last_group_index': lastGroupIndex,
    };
  }

  factory OfflineSubmission.fromMap(Map<String, dynamic> map) {
    // Parse status, defaulting to pendingSync for backwards compatibility
    OfflineSubmissionStatus status = OfflineSubmissionStatus.pendingSync;
    final statusStr = map['status'] as String?;
    if (statusStr != null) {
      status = OfflineSubmissionStatus.values.firstWhere(
        (e) => e.name == statusStr,
        orElse: () => OfflineSubmissionStatus.pendingSync,
      );
    }

    return OfflineSubmission(
      localId: map['local_id'] as String,
      surveyId: map['survey_id'] as String,
      answersJson: map['answers_json'] as String,
      language: map['language'] as String?,
      latitude: map['latitude'] as double?,
      longitude: map['longitude'] as double?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      serverSubmissionId: map['server_submission_id'] as String?,
      surveyVersionUsed: map['survey_version_used'] != null
          ? DateTime.parse(map['survey_version_used'] as String)
          : null,
      status: status,
      lastGroupIndex: map['last_group_index'] as int?,
    );
  }

  OfflineSubmission copyWith({
    String? localId,
    String? surveyId,
    String? answersJson,
    String? language,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? serverSubmissionId,
    DateTime? surveyVersionUsed,
    OfflineSubmissionStatus? status,
    int? lastGroupIndex,
  }) {
    return OfflineSubmission(
      localId: localId ?? this.localId,
      surveyId: surveyId ?? this.surveyId,
      answersJson: answersJson ?? this.answersJson,
      language: language ?? this.language,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      serverSubmissionId: serverSubmissionId ?? this.serverSubmissionId,
      surveyVersionUsed: surveyVersionUsed ?? this.surveyVersionUsed,
      status: status ?? this.status,
      lastGroupIndex: lastGroupIndex ?? this.lastGroupIndex,
    );
  }
}

/// Local database service for offline data storage
class OfflineStorageService {
  static OfflineStorageService? _instance;
  static OfflineStorageService get instance =>
      _instance ??= OfflineStorageService._();

  OfflineStorageService._();

  Database? _database;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  static const String _dbName = 'naari_survey_offline.db';
  static const int _dbVersion = 7;

  // Table names
  static const String _syncQueueTable = 'sync_queue';
  static const String _cachedSurveysTable = 'cached_surveys';
  static const String _offlineSubmissionsTable = 'offline_submissions';
  static const String _pendingFilesTable = 'pending_files';
  static const String _consentAcceptanceTable = 'consent_acceptance';
  static const String _syncLogsTable = 'sync_logs';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, _dbName);

      debugPrint('OfflineStorage: Initializing database at $path');

      final db = await openDatabase(
        path,
        version: _dbVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );

      _isInitialized = true;
      debugPrint('OfflineStorage: Database initialized successfully');
      return db;
    } catch (e) {
      debugPrint('OfflineStorage: Error initializing database: $e');
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    debugPrint('OfflineStorage: Creating database tables');

    // Sync queue table
    await db.execute('''
      CREATE TABLE $_syncQueueTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        operation_type TEXT NOT NULL,
        data_json TEXT NOT NULL,
        status TEXT NOT NULL DEFAULT 'pending',
        retry_count INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        last_attempt_at TEXT,
        error_message TEXT,
        priority INTEGER NOT NULL DEFAULT 10
      )
    ''');

    // Cached surveys table - composite primary key (id, language) to allow
    // multiple language versions of the same survey
    await db.execute('''
      CREATE TABLE $_cachedSurveysTable (
        id TEXT NOT NULL,
        survey_json TEXT NOT NULL,
        language TEXT NOT NULL DEFAULT '',
        cached_at TEXT NOT NULL,
        expires_at TEXT,
        survey_updated_at TEXT,
        PRIMARY KEY (id, language)
      )
    ''');

    // Offline submissions table
    await db.execute('''
      CREATE TABLE $_offlineSubmissionsTable (
        local_id TEXT PRIMARY KEY,
        survey_id TEXT NOT NULL,
        answers_json TEXT NOT NULL,
        language TEXT,
        latitude REAL,
        longitude REAL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        server_submission_id TEXT,
        survey_version_used TEXT,
        status TEXT NOT NULL DEFAULT 'pendingSync',
        last_group_index INTEGER
      )
    ''');

    // Pending files table (for images that need to be uploaded)
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_pendingFilesTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        local_path TEXT NOT NULL,
        file_type TEXT NOT NULL,
        submission_id TEXT NOT NULL,
        created_at TEXT NOT NULL,
        uploaded INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Consent acceptance table (for storing consent acceptance offline)
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_consentAcceptanceTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        survey_id TEXT NOT NULL,
        language TEXT NOT NULL,
        consent_version_hash TEXT NOT NULL,
        user_id TEXT,
        accepted_at TEXT NOT NULL,
        synced INTEGER NOT NULL DEFAULT 0,
        UNIQUE(survey_id, language, consent_version_hash, user_id)
      )
    ''');

    await _createSyncLogsTable(db);

    // Create indexes for better query performance
    await db.execute(
      'CREATE INDEX idx_sync_queue_status ON $_syncQueueTable(status)',
    );
    await db.execute(
      'CREATE INDEX idx_sync_queue_priority ON $_syncQueueTable(priority, created_at)',
    );
    await db.execute(
      'CREATE INDEX idx_offline_submissions_survey ON $_offlineSubmissionsTable(survey_id)',
    );

    debugPrint('OfflineStorage: Database tables created');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint(
      'OfflineStorage: Upgrading database from v$oldVersion to v$newVersion',
    );

    if (oldVersion < 2) {
      // Create pending files table
      await db.execute('''
        CREATE TABLE IF NOT EXISTS $_pendingFilesTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          local_path TEXT NOT NULL,
          file_type TEXT NOT NULL,
          submission_id TEXT NOT NULL,
          created_at TEXT NOT NULL,
          uploaded INTEGER NOT NULL DEFAULT 0
        )
      ''');
    }

    if (oldVersion < 3) {
      // Create consent acceptance table
      await db.execute('''
        CREATE TABLE IF NOT EXISTS $_consentAcceptanceTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          survey_id TEXT NOT NULL,
          language TEXT NOT NULL,
          consent_version_hash TEXT NOT NULL,
          user_id TEXT,
          accepted_at TEXT NOT NULL,
          synced INTEGER NOT NULL DEFAULT 0,
          UNIQUE(survey_id, language, consent_version_hash, user_id)
        )
      ''');
    }

    if (oldVersion < 4) {
      // Add survey version tracking columns
      // Add survey_updated_at to cached_surveys table
      await db.execute('''
        ALTER TABLE $_cachedSurveysTable ADD COLUMN survey_updated_at TEXT
      ''');

      // Add survey_version_used to offline_submissions table
      await db.execute('''
        ALTER TABLE $_offlineSubmissionsTable ADD COLUMN survey_version_used TEXT
      ''');

      debugPrint('OfflineStorage: Added version tracking columns');
    }

    if (oldVersion < 5) {
      // Migrate cached_surveys table to support composite primary key (id, language)
      // This allows caching multiple language versions of the same survey
      debugPrint('OfflineStorage: Migrating cached_surveys to composite key');

      // Create new table with composite primary key
      await db.execute('''
        CREATE TABLE ${_cachedSurveysTable}_new (
          id TEXT NOT NULL,
          survey_json TEXT NOT NULL,
          language TEXT NOT NULL DEFAULT '',
          cached_at TEXT NOT NULL,
          expires_at TEXT,
          survey_updated_at TEXT,
          PRIMARY KEY (id, language)
        )
      ''');

      // Copy existing data, converting NULL language to empty string
      await db.execute('''
        INSERT OR REPLACE INTO ${_cachedSurveysTable}_new 
        (id, survey_json, language, cached_at, expires_at, survey_updated_at)
        SELECT id, survey_json, COALESCE(language, ''), cached_at, expires_at, survey_updated_at
        FROM $_cachedSurveysTable
      ''');

      // Drop old table and rename new one
      await db.execute('DROP TABLE $_cachedSurveysTable');
      await db.execute(
        'ALTER TABLE ${_cachedSurveysTable}_new RENAME TO $_cachedSurveysTable',
      );

      debugPrint('OfflineStorage: Migrated cached_surveys to composite key');
    }

    if (oldVersion < 6) {
      // Add status and last_group_index columns to offline_submissions table
      // for draft saving functionality
      debugPrint('OfflineStorage: Adding draft support columns');

      // Add status column with default 'pendingSync' for existing entries
      await db.execute('''
        ALTER TABLE $_offlineSubmissionsTable ADD COLUMN status TEXT NOT NULL DEFAULT 'pendingSync'
      ''');

      // Add last_group_index column for resuming drafts
      await db.execute('''
        ALTER TABLE $_offlineSubmissionsTable ADD COLUMN last_group_index INTEGER
      ''');

      debugPrint('OfflineStorage: Added draft support columns');
    }

    if (oldVersion < 7) {
      await _createSyncLogsTable(db);
      debugPrint('OfflineStorage: Added sync logs table');
    }
  }

  Future<void> _createSyncLogsTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_syncLogsTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        operation_type TEXT NOT NULL,
        status TEXT NOT NULL,
        message TEXT NOT NULL,
        local_id TEXT,
        survey_id TEXT,
        question_id TEXT,
        server_submission_id TEXT,
        created_at TEXT NOT NULL
      )
    ''');

    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_sync_logs_created_at ON $_syncLogsTable(created_at)',
    );
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_sync_logs_status ON $_syncLogsTable(status)',
    );
  }

  // ==================== SYNC QUEUE OPERATIONS ====================

  /// Add an item to the sync queue
  Future<int> addToSyncQueue(SyncQueueItem item) async {
    final db = await database;
    final map = item.toMap();
    map.remove('id'); // Let SQLite auto-generate the ID

    final id = await db.insert(_syncQueueTable, map);
    debugPrint('OfflineStorage: Added sync queue item with ID: $id');
    return id;
  }

  /// Get all pending sync queue items (including failed for retry)
  Future<List<SyncQueueItem>> getPendingSyncItems() async {
    final db = await database;
    final results = await db.query(
      _syncQueueTable,
      where: 'status = ? OR status = ?',
      whereArgs: [SyncStatus.pending.name, SyncStatus.failed.name],
      orderBy: 'priority ASC, created_at ASC',
    );
    return results.map((map) => SyncQueueItem.fromMap(map)).toList();
  }

  /// Get sync queue item by ID
  Future<SyncQueueItem?> getSyncQueueItem(int id) async {
    final db = await database;
    final results = await db.query(
      _syncQueueTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) return null;
    return SyncQueueItem.fromMap(results.first);
  }

  /// Update sync queue item status
  Future<void> updateSyncQueueItem(SyncQueueItem item) async {
    final db = await database;
    await db.update(
      _syncQueueTable,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  /// Update submission ID in pending sync queue items (for file uploads)
  /// This is called after a survey submission is synced and we get the server ID
  Future<void> updatePendingFileSubmissionIds(
    String localId,
    String serverSubmissionId,
  ) async {
    final db = await database;

    // Get all pending file upload items for this local submission ID
    final items = await db.query(
      _syncQueueTable,
      where: 'status = ? AND (operation_type = ? OR operation_type = ?)',
      whereArgs: [
        SyncStatus.pending.name,
        SyncOperationType.uploadSignature.name,
        SyncOperationType.uploadPhoto.name,
      ],
    );

    for (final item in items) {
      final dataJson = item['data_json'] as String;
      final data = jsonDecode(dataJson) as Map<String, dynamic>;

      // Check if this item belongs to the local submission
      if (data['submissionId'] == localId) {
        // Update the submission ID to the server ID
        data['submissionId'] = serverSubmissionId;

        await db.update(
          _syncQueueTable,
          {'data_json': jsonEncode(data)},
          where: 'id = ?',
          whereArgs: [item['id']],
        );

        debugPrint(
          'OfflineStorage: Updated file upload queue item ${item['id']} with server submission ID $serverSubmissionId',
        );
      }
    }

    // Also update the pending_files table
    await db.update(
      _pendingFilesTable,
      {'submission_id': serverSubmissionId},
      where: 'submission_id = ?',
      whereArgs: [localId],
    );
  }

  /// Remove completed items from sync queue
  Future<int> removeCompletedSyncItems() async {
    final db = await database;
    final deletedCount = await db.delete(
      _syncQueueTable,
      where: 'status = ?',
      whereArgs: [SyncStatus.completed.name],
    );
    debugPrint('OfflineStorage: Removed $deletedCount completed sync items');
    return deletedCount;
  }

  /// Get count of items that need syncing.
  /// Counts unsynced submissions from offline_submissions (source of truth)
  /// plus non-submission sync queue items (file uploads, answer saves, etc.)
  /// to avoid double-counting submissions that exist in both tables.
  Future<int> getPendingSyncCount() async {
    final db = await database;

    final unsyncedSubmissions =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) as count FROM $_offlineSubmissionsTable WHERE status = ?',
            [OfflineSubmissionStatus.pendingSync.name],
          ),
        ) ??
        0;

    final nonSubmissionQueueItems =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) as count FROM $_syncQueueTable WHERE status IN (?, ?) AND operation_type NOT IN (?, ?, ?)',
            [
              SyncStatus.pending.name,
              SyncStatus.syncing.name,
              SyncOperationType.submitSurvey.name,
              SyncOperationType.uploadSignature.name,
              SyncOperationType.uploadPhoto.name,
            ],
          ),
        ) ??
        0;

    final pendingFiles =
        Sqflite.firstIntValue(
          await db.rawQuery(
            '''
            SELECT COUNT(*)
            FROM $_pendingFilesTable
            WHERE uploaded = 0
              AND submission_id NOT IN (
                SELECT local_id
                FROM $_offlineSubmissionsTable
                WHERE status = ?
              )
            ''',
            [OfflineSubmissionStatus.draft.name],
          ),
        ) ??
        0;

    final total = unsyncedSubmissions + nonSubmissionQueueItems + pendingFiles;
    debugPrint(
      'OfflineStorage: Pending count - submissions: $unsyncedSubmissions, queueItems: $nonSubmissionQueueItems, files: $pendingFiles, total: $total',
    );
    return total;
  }

  /// Remove saveAnswer sync items for local submissions
  /// These should not be synced individually - they'll be sent via submitSurvey
  Future<int> removeLocalSubmissionAnswerSaves() async {
    final db = await database;
    final deletedCount = await db.delete(
      _syncQueueTable,
      where: 'operation_type = ? AND data_json LIKE ?',
      whereArgs: [
        SyncOperationType.saveAnswer.name,
        '%"submissionId":"local_%',
      ],
    );
    debugPrint(
      'OfflineStorage: Removed $deletedCount saveAnswer items for local submissions',
    );
    return deletedCount;
  }

  // ==================== CACHED SURVEYS OPERATIONS ====================

  /// Cache a survey for offline access
  Future<void> cacheSurvey(CachedSurvey survey) async {
    final db = await database;
    final map = survey.toMap();
    debugPrint(
      'OfflineStorage: Caching survey - id: ${survey.id}, language: "${survey.language}", expires: ${survey.expiresAt}',
    );
    debugPrint(
      'OfflineStorage: Map to insert - id: ${map['id']}, language: "${map['language']}"',
    );
    await db.insert(
      _cachedSurveysTable,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('OfflineStorage: Cached survey ${survey.id} successfully');
  }

  /// Get a cached survey by ID
  Future<CachedSurvey?> getCachedSurvey(String id, {String? language}) async {
    final db = await database;

    // Normalize language: null becomes empty string to match DB schema
    final normalizedLanguage = language ?? '';

    debugPrint(
      'OfflineStorage: Looking for survey $id with language: $language (normalized: $normalizedLanguage)',
    );

    // First try exact match
    var results = await db.query(
      _cachedSurveysTable,
      where: 'id = ? AND language = ?',
      whereArgs: [id, normalizedLanguage],
      limit: 1,
    );

    // Only allow fallback to any cached language when NO specific language was requested.
    // This prevents returning Hindi when English is explicitly requested.
    // If a specific language is requested but not cached, return null so the caller
    // can fetch from the server when online.
    if (results.isEmpty && normalizedLanguage.isEmpty) {
      debugPrint(
        'OfflineStorage: No default language, trying any language for survey $id',
      );
      results = await db.query(
        _cachedSurveysTable,
        where: 'id = ?',
        whereArgs: [id],
        orderBy: 'cached_at DESC',
        limit: 1,
      );
    }

    // Log when we couldn't find the requested language
    if (results.isEmpty && normalizedLanguage.isNotEmpty) {
      debugPrint(
        'OfflineStorage: No cache found for survey $id with language $normalizedLanguage',
      );
    }

    debugPrint('OfflineStorage: Found ${results.length} results');

    if (results.isEmpty) {
      // Debug: check what surveys exist in the table
      final allSurveys = await db.query(_cachedSurveysTable);
      debugPrint('OfflineStorage: All cached surveys: ${allSurveys.length}');
      for (final s in allSurveys) {
        debugPrint(
          'OfflineStorage:   - id: ${s['id']}, language: "${s['language']}", expires: ${s['expires_at']}',
        );
      }
      return null;
    }

    final cached = CachedSurvey.fromMap(results.first);

    // Check if expired
    if (cached.isExpired) {
      debugPrint(
        'OfflineStorage: Survey $id is expired (expires: ${cached.expiresAt})',
      );
      await deleteCachedSurvey(id, language: cached.language);
      return null;
    }

    debugPrint(
      'OfflineStorage: Returning cached survey $id (language: ${cached.language})',
    );
    return cached;
  }

  /// Get all cached surveys
  Future<List<CachedSurvey>> getAllCachedSurveys() async {
    final db = await database;
    final results = await db.query(
      _cachedSurveysTable,
      orderBy: 'cached_at DESC',
    );

    debugPrint(
      'OfflineStorage: getAllCachedSurveys - found ${results.length} rows in DB',
    );

    final surveys = <CachedSurvey>[];
    for (final map in results) {
      debugPrint(
        'OfflineStorage: Row - id: ${map['id']}, language: "${map['language']}", expires: ${map['expires_at']}',
      );
      final cached = CachedSurvey.fromMap(map);
      if (!cached.isExpired) {
        surveys.add(cached);
      } else {
        debugPrint('OfflineStorage: Survey ${cached.id} is expired, deleting');
        // Clean up expired - delete this specific language version
        await deleteCachedSurvey(cached.id, language: cached.language);
      }
    }
    debugPrint(
      'OfflineStorage: Returning ${surveys.length} non-expired surveys',
    );
    return surveys;
  }

  // ==================== PENDING FILES OPERATIONS ====================

  /// Get pending files for a submission
  Future<List<Map<String, dynamic>>> getPendingFilesForSubmission(
    String submissionId,
  ) async {
    final db = await database;
    return await db.query(
      _pendingFilesTable,
      where: 'submission_id = ? AND uploaded = 0',
      whereArgs: [submissionId],
    );
  }

  /// Mark file as uploaded
  Future<void> markFileAsUploaded(int id) async {
    final db = await database;
    await db.update(
      _pendingFilesTable,
      {'uploaded': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete a cached survey
  /// If language is provided, only that specific language version is deleted
  /// If language is null, all language versions of the survey are deleted
  Future<void> deleteCachedSurvey(String id, {String? language}) async {
    final db = await database;
    if (language != null) {
      await db.delete(
        _cachedSurveysTable,
        where: 'id = ? AND language = ?',
        whereArgs: [id, language],
      );
    } else {
      await db.delete(_cachedSurveysTable, where: 'id = ?', whereArgs: [id]);
    }
  }

  /// Clear all expired cached surveys
  Future<int> clearExpiredCache() async {
    final db = await database;
    return await db.delete(
      _cachedSurveysTable,
      where: 'expires_at IS NOT NULL AND expires_at < ?',
      whereArgs: [DateTime.now().toIso8601String()],
    );
  }

  // ==================== OFFLINE SUBMISSIONS OPERATIONS ====================

  /// Save an offline submission draft
  Future<void> saveOfflineSubmission(OfflineSubmission submission) async {
    final db = await database;
    await db.insert(
      _offlineSubmissionsTable,
      submission.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint(
      'OfflineStorage: Saved offline submission ${submission.localId}',
    );
  }

  /// Get an offline submission by local ID
  Future<OfflineSubmission?> getOfflineSubmission(String localId) async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'local_id = ?',
      whereArgs: [localId],
    );
    if (results.isEmpty) return null;
    return OfflineSubmission.fromMap(results.first);
  }

  /// Get all offline submissions for a survey
  Future<List<OfflineSubmission>> getOfflineSubmissionsForSurvey(
    String surveyId,
  ) async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'survey_id = ?',
      whereArgs: [surveyId],
      orderBy: 'updated_at DESC',
    );
    return results.map((map) => OfflineSubmission.fromMap(map)).toList();
  }

  /// Get all unsynced offline submissions
  Future<List<OfflineSubmission>> getUnsyncedSubmissions() async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'status = ?',
      whereArgs: [OfflineSubmissionStatus.pendingSync.name],
      orderBy: 'created_at ASC',
    );
    return results.map((map) => OfflineSubmission.fromMap(map)).toList();
  }

  /// Delete an offline submission
  Future<void> deleteOfflineSubmission(String localId) async {
    final db = await database;
    await db.delete(
      _offlineSubmissionsTable,
      where: 'local_id = ?',
      whereArgs: [localId],
    );
  }

  /// Update offline submission with server ID after sync
  Future<void> markSubmissionSynced(
    String localId,
    String serverSubmissionId,
  ) async {
    final db = await database;
    await db.update(
      _offlineSubmissionsTable,
      {
        'server_submission_id': serverSubmissionId,
        'status': OfflineSubmissionStatus.synced.name,
      },
      where: 'local_id = ?',
      whereArgs: [localId],
    );
  }

  // ==================== DRAFT OPERATIONS ====================

  /// Save a draft submission (auto-save when user navigates away)
  Future<void> saveDraft({
    required String localId,
    required String surveyId,
    required String answersJson,
    String? language,
    double? latitude,
    double? longitude,
    int? lastGroupIndex,
    DateTime? surveyVersionUsed,
    String? serverSubmissionId,
  }) async {
    final db = await database;
    final now = DateTime.now();
    final effectiveServerSubmissionId =
        serverSubmissionId ?? (!localId.startsWith('local_') ? localId : null);

    // Check if a draft already exists for this local ID
    final existing = await getOfflineSubmission(localId);

    if (existing != null) {
      // Update existing draft
      await db.update(
        _offlineSubmissionsTable,
        {
          'answers_json': answersJson,
          'language': language,
          'latitude': latitude,
          'longitude': longitude,
          'updated_at': now.toIso8601String(),
          'status': OfflineSubmissionStatus.draft.name,
          'last_group_index': lastGroupIndex,
          'survey_version_used': surveyVersionUsed?.toIso8601String(),
          'server_submission_id':
              effectiveServerSubmissionId ?? existing.serverSubmissionId,
        },
        where: 'local_id = ?',
        whereArgs: [localId],
      );
      debugPrint('OfflineStorage: Updated draft $localId');
    } else {
      // Before creating a new draft, clean up any existing draft for this survey
      // that has this localId as its serverSubmissionId. This happens when a user
      // continues from a synced server draft: the original local_xxx entry still
      // exists with serverSubmissionId = serverID, and auto-save creates a new
      // entry with localId = serverID. Delete the old one to prevent duplicates.
      if (!localId.startsWith('local_')) {
        final oldDraft = await getOfflineSubmissionByServerId(localId);
        if (oldDraft != null) {
          await deleteOfflineSubmission(oldDraft.localId);
          debugPrint(
            'OfflineStorage: Removed old local draft ${oldDraft.localId} (serverSubmissionId=$localId) to prevent duplicates',
          );
        }
      }

      // Create new draft
      final draft = OfflineSubmission(
        localId: localId,
        surveyId: surveyId,
        answersJson: answersJson,
        language: language,
        latitude: latitude,
        longitude: longitude,
        createdAt: now,
        updatedAt: now,
        status: OfflineSubmissionStatus.draft,
        lastGroupIndex: lastGroupIndex,
        surveyVersionUsed: surveyVersionUsed,
        serverSubmissionId: effectiveServerSubmissionId,
      );
      await db.insert(
        _offlineSubmissionsTable,
        draft.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      debugPrint('OfflineStorage: Created new draft $localId');
    }
  }

  /// Get all draft submissions for a survey
  Future<List<OfflineSubmission>> getDraftsForSurvey(String surveyId) async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'survey_id = ? AND status = ?',
      whereArgs: [surveyId, OfflineSubmissionStatus.draft.name],
      orderBy: 'updated_at DESC',
    );
    return results.map((map) => OfflineSubmission.fromMap(map)).toList();
  }

  /// Get all draft submissions across all surveys
  Future<List<OfflineSubmission>> getAllDrafts() async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'status = ?',
      whereArgs: [OfflineSubmissionStatus.draft.name],
      orderBy: 'updated_at DESC',
    );
    return results.map((map) => OfflineSubmission.fromMap(map)).toList();
  }

  /// Get pending sync submissions (submitted but not synced)
  Future<List<OfflineSubmission>> getPendingSyncSubmissions() async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'status = ?',
      whereArgs: [OfflineSubmissionStatus.pendingSync.name],
      orderBy: 'created_at ASC',
    );
    return results.map((map) => OfflineSubmission.fromMap(map)).toList();
  }

  /// Update a draft to pending sync status (when user submits)
  Future<void> markDraftAsPendingSync(String localId) async {
    final db = await database;
    await db.update(
      _offlineSubmissionsTable,
      {
        'status': OfflineSubmissionStatus.pendingSync.name,
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'local_id = ?',
      whereArgs: [localId],
    );
    debugPrint('OfflineStorage: Marked draft $localId as pending sync');
  }

  /// Delete a draft submission
  Future<void> deleteDraft(String localId) async {
    final db = await database;
    await db.delete(
      _offlineSubmissionsTable,
      where: 'local_id = ? AND status = ?',
      whereArgs: [localId, OfflineSubmissionStatus.draft.name],
    );
    debugPrint('OfflineStorage: Deleted draft $localId');
  }

  /// Delete local draft rows linked to a server submission ID.
  /// Keeps the active row when it has already been converted to pending sync.
  Future<int> deleteDraftsForServerSubmission(
    String serverSubmissionId, {
    String? exceptLocalId,
  }) async {
    final db = await database;
    final whereParts = <String>[
      'server_submission_id = ?',
      'status = ?',
    ];
    final whereArgs = <Object?>[
      serverSubmissionId,
      OfflineSubmissionStatus.draft.name,
    ];

    if (exceptLocalId != null) {
      whereParts.add('local_id != ?');
      whereArgs.add(exceptLocalId);
    }

    final deleted = await db.delete(
      _offlineSubmissionsTable,
      where: whereParts.join(' AND '),
      whereArgs: whereArgs,
    );
    if (deleted > 0) {
      debugPrint(
        'OfflineStorage: Deleted $deleted draft(s) linked to server submission $serverSubmissionId',
      );
    }
    return deleted;
  }

  /// Check if a draft exists for a given local ID
  Future<bool> hasDraft(String localId) async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'local_id = ? AND status = ?',
      whereArgs: [localId, OfflineSubmissionStatus.draft.name],
      limit: 1,
    );
    return results.isNotEmpty;
  }

  /// Get the list of languages that are actually cached for a given survey.
  /// Excludes the special '__basic__' and '__list__' cache entries.
  /// Returns language codes (e.g. ['en', 'hi', 'ta']).
  Future<List<String>> getCachedLanguagesForSurvey(String surveyId) async {
    final db = await database;
    final results = await db.query(
      _cachedSurveysTable,
      columns: ['language'],
      where: 'id = ? AND language != ? AND language != ? AND language != ?',
      whereArgs: [surveyId, '__basic__', '__list__', ''],
    );
    return results
        .map((row) => row['language'] as String)
        .where((lang) => lang.isNotEmpty)
        .toList();
  }

  /// Update a draft's server submission ID without changing its draft status.
  /// Used when syncing a draft as a server-side draft (not a completed submission).
  Future<void> updateDraftServerId(String localId, String serverId) async {
    final db = await database;
    await db.update(
      _offlineSubmissionsTable,
      {
        'server_submission_id': serverId,
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'local_id = ?',
      whereArgs: [localId],
    );
    debugPrint(
      'OfflineStorage: Updated draft $localId with server ID $serverId',
    );
  }

  /// Retrieve a local draft submission by its linked server submission ID.
  /// Used when clicking "Continue" on a synced server draft while offline —
  /// the responseId is the server UUID, so we look up the local draft that
  /// was linked to it via [updateDraftServerId].
  Future<OfflineSubmission?> getOfflineSubmissionByServerId(
    String serverId,
  ) async {
    final db = await database;
    final results = await db.query(
      _offlineSubmissionsTable,
      where: 'server_submission_id = ?',
      whereArgs: [serverId],
      limit: 1,
    );
    if (results.isEmpty) return null;
    return OfflineSubmission.fromMap(results.first);
  }

  // ==================== PENDING FILES OPERATIONS ====================

  /// Add a pending file for upload
  Future<int> addPendingFile({
    required String localPath,
    required String fileType,
    required String submissionId,
  }) async {
    final db = await database;
    return await db.insert(_pendingFilesTable, {
      'local_path': localPath,
      'file_type': fileType,
      'submission_id': submissionId,
      'created_at': DateTime.now().toIso8601String(),
      'uploaded': 0,
    });
  }

  /// Get pending files for upload
  Future<List<Map<String, dynamic>>> getAllPendingFiles() async {
    final db = await database;
    return await db.query(
      _pendingFilesTable,
      where: 'uploaded = 0',
      orderBy: 'created_at ASC',
    );
  }

  /// Mark file as uploaded
  Future<void> markFileUploaded(int id) async {
    final db = await database;
    await db.update(
      _pendingFilesTable,
      {'uploaded': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Mark file as uploaded by local path
  Future<void> markFileUploadedByPath(String localPath) async {
    final db = await database;
    await db.update(
      _pendingFilesTable,
      {'uploaded': 1},
      where: 'local_path = ?',
      whereArgs: [localPath],
    );
    debugPrint('OfflineStorage: Marked file as uploaded: $localPath');
  }

  /// Remove uploaded files
  Future<int> removeUploadedFiles() async {
    final db = await database;
    return await db.delete(_pendingFilesTable, where: 'uploaded = 1');
  }

  // ==================== CONSENT ACCEPTANCE OPERATIONS ====================

  /// Save consent acceptance for offline use
  Future<void> saveConsentAcceptance({
    required String surveyId,
    required String language,
    required String consentVersionHash,
    String? userId,
  }) async {
    final db = await database;
    await db.insert(_consentAcceptanceTable, {
      'survey_id': surveyId,
      'language': language,
      'consent_version_hash': consentVersionHash,
      'user_id': userId,
      'accepted_at': DateTime.now().toIso8601String(),
      'synced': 0,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint('OfflineStorage: Saved consent acceptance for survey $surveyId');
  }

  /// Check if consent has been accepted for a survey
  Future<bool> hasAcceptedConsent({
    required String surveyId,
    required String language,
    required String consentVersionHash,
    String? userId,
  }) async {
    final db = await database;

    String whereClause =
        'survey_id = ? AND language = ? AND consent_version_hash = ?';
    List<dynamic> whereArgs = [surveyId, language, consentVersionHash];

    if (userId != null) {
      whereClause += ' AND user_id = ?';
      whereArgs.add(userId);
    }

    final results = await db.query(
      _consentAcceptanceTable,
      where: whereClause,
      whereArgs: whereArgs,
      limit: 1,
    );

    return results.isNotEmpty;
  }

  /// Get all unsynced consent acceptances
  Future<List<Map<String, dynamic>>> getUnsyncedConsentAcceptances() async {
    final db = await database;
    return await db.query(
      _consentAcceptanceTable,
      where: 'synced = 0',
      orderBy: 'accepted_at ASC',
    );
  }

  /// Mark consent acceptance as synced
  Future<void> markConsentAcceptanceSynced(int id) async {
    final db = await database;
    await db.update(
      _consentAcceptanceTable,
      {'synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete consent acceptance for a survey
  Future<void> deleteConsentAcceptance(String surveyId) async {
    final db = await database;
    await db.delete(
      _consentAcceptanceTable,
      where: 'survey_id = ?',
      whereArgs: [surveyId],
    );
  }

  // ==================== SYNC LOG OPERATIONS ====================

  /// Save a user-visible sync log entry.
  Future<int> addSyncLog(SyncLogEntry entry) async {
    final db = await database;
    final map = entry.toMap();
    map.remove('id');
    final id = await db.insert(_syncLogsTable, map);
    debugPrint(
      'OfflineStorage: Added sync log $id (${entry.operationType}, ${entry.status.name})',
    );
    return id;
  }

  Future<List<SyncLogEntry>> getRecentSyncLogs({int? limit}) async {
    final db = await database;
    final results = await db.query(
      _syncLogsTable,
      orderBy: 'created_at DESC',
      limit: limit,
    );
    return results.map((map) => SyncLogEntry.fromMap(map)).toList();
  }

  Future<List<SyncLogEntry>> getSyncLogsPage({
    int limit = 25,
    int offset = 0,
  }) async {
    final db = await database;
    final results = await db.query(
      _syncLogsTable,
      orderBy: 'created_at DESC',
      limit: limit,
      offset: offset,
    );
    return results.map((map) => SyncLogEntry.fromMap(map)).toList();
  }

  Future<int> getFailedSyncLogCount() async {
    final db = await database;
    return Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_syncLogsTable WHERE status = ?',
            [SyncStatus.failed.name],
          ),
        ) ??
        0;
  }

  // ==================== UTILITY OPERATIONS ====================

  /// Clear all offline data
  Future<void> clearAllData() async {
    final db = await database;
    await db.delete(_syncQueueTable);
    await db.delete(_cachedSurveysTable);
    await db.delete(_offlineSubmissionsTable);
    await db.delete(_pendingFilesTable);
    await db.delete(_consentAcceptanceTable);
    await db.delete(_syncLogsTable);
    debugPrint('OfflineStorage: Cleared all offline data');
  }

  /// Get storage statistics
  Future<Map<String, int>> getStorageStats() async {
    final db = await database;

    // Count pending and syncing items in sync queue (not completed/failed)
    final syncCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_syncQueueTable WHERE status IN (?, ?)',
            [SyncStatus.pending.name, SyncStatus.syncing.name],
          ),
        ) ??
        0;
    final failedQueueCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_syncQueueTable WHERE status = ?',
            [SyncStatus.failed.name],
          ),
        ) ??
        0;
    // Count only full offline-ready surveys. The app also stores lightweight
    // __list__ and __basic__ cache rows while browsing online, which should not
    // be shown as downloaded/offline-ready survey count.
    final cachedCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            '''
            SELECT COUNT(DISTINCT id)
            FROM $_cachedSurveysTable
            WHERE language NOT IN (?, ?)
              AND (expires_at IS NULL OR expires_at > ?)
            ''',
            ['__list__', '__basic__', DateTime.now().toIso8601String()],
          ),
        ) ??
        0;
    // Count only submitted offline submissions that are waiting to sync.
    final submissionsCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_offlineSubmissionsTable WHERE status = ?',
            [OfflineSubmissionStatus.pendingSync.name],
          ),
        ) ??
        0;
    final draftCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_offlineSubmissionsTable WHERE status = ?',
            [OfflineSubmissionStatus.draft.name],
          ),
        ) ??
        0;
    // Count only files that haven't been uploaded yet and are not attached to
    // local drafts. Draft files upload only after the draft is submitted.
    final filesCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            '''
            SELECT COUNT(*)
            FROM $_pendingFilesTable
            WHERE uploaded = 0
              AND submission_id NOT IN (
                SELECT local_id
                FROM $_offlineSubmissionsTable
                WHERE status = ?
              )
            ''',
            [OfflineSubmissionStatus.draft.name],
          ),
        ) ??
        0;
    final consentCount =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM $_consentAcceptanceTable WHERE synced = 0',
          ),
        ) ??
        0;
    final pendingTotal = await getPendingSyncCount();
    final failedLogCount = await getFailedSyncLogCount();

    return {
      'syncQueue': syncCount,
      'pendingTotal': pendingTotal,
      'failedQueue': failedQueueCount,
      'failedLogs': failedLogCount,
      'cachedSurveys': cachedCount,
      'offlineSubmissions': submissionsCount,
      'draftSubmissions': draftCount,
      'pendingFiles': filesCount,
      'offlineConsent': consentCount,
    };
  }

  /// Clean up old local data to prevent unbounded storage growth.
  /// - Synced submissions: older than 30 days
  /// - Draft submissions: older than 90 days
  /// - Expired cached surveys: past end_date
  Future<Map<String, int>> cleanupOldEntries() async {
    final db = await database;
    final now = DateTime.now();
    final syncedCutoff = now
        .subtract(const Duration(days: 30))
        .toIso8601String();
    final draftCutoff = now
        .subtract(const Duration(days: 90))
        .toIso8601String();

    // Delete old synced submissions
    final syncedDeleted = await db.delete(
      _offlineSubmissionsTable,
      where: 'status = ? AND updated_at < ?',
      whereArgs: ['synced', syncedCutoff],
    );

    // Delete old drafts
    final draftsDeleted = await db.delete(
      _offlineSubmissionsTable,
      where: 'status = ? AND updated_at < ?',
      whereArgs: ['draft', draftCutoff],
    );

    // Delete expired cached surveys (cached_at used as proxy for freshness)
    final cachedDeleted = await db.delete(
      _cachedSurveysTable,
      where: 'cached_at < ?',
      whereArgs: [syncedCutoff],
    );

    final syncLogsDeleted = await db.delete(
      _syncLogsTable,
      where: 'created_at < ?',
      whereArgs: [syncedCutoff],
    );

    debugPrint(
      'OfflineStorage: Cleanup - removed $syncedDeleted synced submissions, '
      '$draftsDeleted old drafts, $cachedDeleted expired cached surveys, '
      '$syncLogsDeleted sync logs',
    );

    return {
      'syncedDeleted': syncedDeleted,
      'draftsDeleted': draftsDeleted,
      'cachedDeleted': cachedDeleted,
      'syncLogsDeleted': syncLogsDeleted,
    };
  }

  /// Close the database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
    _isInitialized = false;
  }
}
