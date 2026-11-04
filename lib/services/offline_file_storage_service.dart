import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

/// Service for managing offline file storage
/// Files are copied from temp directories to app documents for persistence
class OfflineFileStorageService {
  static OfflineFileStorageService? _instance;
  static OfflineFileStorageService get instance =>
      _instance ??= OfflineFileStorageService._();

  OfflineFileStorageService._();

  static const String _offlineFilesDir = 'offline_files';
  static const String _signaturesDir = 'signatures';
  static const String _photosDir = 'photos';
  static const String _audioDir = 'audio';

  Directory? _baseDirectory;

  /// Initialize the offline file storage directory
  Future<void> initialize() async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      _baseDirectory = Directory(path.join(appDocDir.path, _offlineFilesDir));
      
      // Create subdirectories if they don't exist
      await _ensureDirectoryExists(path.join(_baseDirectory!.path, _signaturesDir));
      await _ensureDirectoryExists(path.join(_baseDirectory!.path, _photosDir));
      await _ensureDirectoryExists(path.join(_baseDirectory!.path, _audioDir));
      
      debugPrint('OfflineFileStorage: Initialized at ${_baseDirectory!.path}');
    } catch (e) {
      debugPrint('OfflineFileStorage: Error initializing: $e');
      rethrow;
    }
  }

  Future<void> _ensureDirectoryExists(String dirPath) async {
    final dir = Directory(dirPath);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  /// Get the base directory, initializing if needed
  Future<Directory> get baseDirectory async {
    if (_baseDirectory == null) {
      await initialize();
    }
    return _baseDirectory!;
  }

  /// Copy a file to offline storage and return the new path
  /// This ensures files aren't deleted when temp directory is cleaned
  Future<String> copyToOfflineStorage({
    required String sourcePath,
    required OfflineFileType fileType,
    String? customFileName,
  }) async {
    try {
      final sourceFile = File(sourcePath);
      
      if (!await sourceFile.exists()) {
        throw FileSystemException('Source file does not exist', sourcePath);
      }

      final base = await baseDirectory;
      final subDir = _getSubdirectory(fileType);
      final targetDir = Directory(path.join(base.path, subDir));
      
      // Generate unique filename if not provided
      final fileName = customFileName ?? 
          '${const Uuid().v4()}${path.extension(sourcePath)}';
      
      final targetPath = path.join(targetDir.path, fileName);
      
      // Copy file to offline storage
      await sourceFile.copy(targetPath);
      
      debugPrint('OfflineFileStorage: Copied file to $targetPath');
      return targetPath;
    } catch (e) {
      debugPrint('OfflineFileStorage: Error copying file: $e');
      rethrow;
    }
  }

  /// Get a file from offline storage
  Future<File?> getFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        return file;
      }
      return null;
    } catch (e) {
      debugPrint('OfflineFileStorage: Error getting file: $e');
      return null;
    }
  }

  /// Check if a file exists
  Future<bool> fileExists(String filePath) async {
    try {
      return await File(filePath).exists();
    } catch (e) {
      return false;
    }
  }

  /// Delete a file from offline storage
  Future<bool> deleteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        debugPrint('OfflineFileStorage: Deleted file $filePath');
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('OfflineFileStorage: Error deleting file: $e');
      return false;
    }
  }

  /// Delete all files for a specific submission
  Future<void> deleteFilesForSubmission(String submissionId) async {
    try {
      final base = await baseDirectory;
      
      // Search in all subdirectories for files containing the submission ID
      for (final subDir in [_signaturesDir, _photosDir, _audioDir]) {
        final dir = Directory(path.join(base.path, subDir));
        if (await dir.exists()) {
          await for (final entity in dir.list()) {
            if (entity is File && path.basename(entity.path).contains(submissionId)) {
              await entity.delete();
              debugPrint('OfflineFileStorage: Deleted ${entity.path}');
            }
          }
        }
      }
    } catch (e) {
      debugPrint('OfflineFileStorage: Error deleting files for submission: $e');
    }
  }

  /// Clean up old files (files older than specified duration)
  Future<int> cleanupOldFiles({Duration maxAge = const Duration(days: 30)}) async {
    int deletedCount = 0;
    final cutoffDate = DateTime.now().subtract(maxAge);
    
    try {
      final base = await baseDirectory;
      
      for (final subDir in [_signaturesDir, _photosDir, _audioDir]) {
        final dir = Directory(path.join(base.path, subDir));
        if (await dir.exists()) {
          await for (final entity in dir.list()) {
            if (entity is File) {
              final stat = await entity.stat();
              if (stat.modified.isBefore(cutoffDate)) {
                await entity.delete();
                deletedCount++;
              }
            }
          }
        }
      }
      
      debugPrint('OfflineFileStorage: Cleaned up $deletedCount old files');
    } catch (e) {
      debugPrint('OfflineFileStorage: Error during cleanup: $e');
    }
    
    return deletedCount;
  }

  /// Get storage statistics
  Future<Map<String, dynamic>> getStorageStats() async {
    try {
      final base = await baseDirectory;
      int totalFiles = 0;
      int totalBytes = 0;
      final Map<String, int> filesByType = {};
      
      for (final subDir in [_signaturesDir, _photosDir, _audioDir]) {
        final dir = Directory(path.join(base.path, subDir));
        int count = 0;
        
        if (await dir.exists()) {
          await for (final entity in dir.list()) {
            if (entity is File) {
              count++;
              totalFiles++;
              final stat = await entity.stat();
              totalBytes += stat.size;
            }
          }
        }
        
        filesByType[subDir] = count;
      }
      
      return {
        'totalFiles': totalFiles,
        'totalBytes': totalBytes,
        'totalMB': (totalBytes / (1024 * 1024)).toStringAsFixed(2),
        'signatures': filesByType[_signaturesDir] ?? 0,
        'photos': filesByType[_photosDir] ?? 0,
        'audio': filesByType[_audioDir] ?? 0,
      };
    } catch (e) {
      debugPrint('OfflineFileStorage: Error getting stats: $e');
      return {};
    }
  }

  /// Clear all offline files
  Future<void> clearAll() async {
    try {
      final base = await baseDirectory;
      if (await base.exists()) {
        await base.delete(recursive: true);
        await initialize(); // Recreate directories
      }
      debugPrint('OfflineFileStorage: Cleared all offline files');
    } catch (e) {
      debugPrint('OfflineFileStorage: Error clearing files: $e');
    }
  }

  String _getSubdirectory(OfflineFileType fileType) {
    switch (fileType) {
      case OfflineFileType.signature:
        return _signaturesDir;
      case OfflineFileType.photo:
        return _photosDir;
      case OfflineFileType.audio:
        return _audioDir;
    }
  }
}

/// Types of files that can be stored offline
enum OfflineFileType {
  signature,
  photo,
  audio,
}
