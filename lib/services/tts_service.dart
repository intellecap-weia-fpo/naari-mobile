import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static TTSService? _instance;
  static TTSService get instance => _instance ??= TTSService._();
  
  TTSService._();
  
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;

  // External callback for completion events
  VoidCallback? _externalCompletionCallback;

  Future<void> initialize() async {
    if (_isInitialized) return;

    _flutterTts.setStartHandler(() {
      _isSpeaking = true;
    });

    _flutterTts.setCompletionHandler(() {
      _isSpeaking = false;
      _externalCompletionCallback?.call();
    });

    _flutterTts.setErrorHandler((dynamic msg) {
      _isSpeaking = false;
      _externalCompletionCallback?.call();
    });

    _flutterTts.setCancelHandler(() {
      _isSpeaking = false;
      _externalCompletionCallback?.call();
    });

    _isInitialized = true;
  }

  /// Set a callback to be called when speech completes, errors, or is cancelled
  void setCompletionCallback(VoidCallback? callback) {
    _externalCompletionCallback = callback;
  }
  
  Future<void> speak(String text) async {
    if (!_isInitialized) {
      await initialize();
    }

    print("Speak $text\n\n");
    
    if (_isSpeaking) {
      await stop();
    }
    
    await _flutterTts.speak(text);
  }
  
  Future<void> stop() async {
    await _flutterTts.stop();
    _isSpeaking = false;
  }
  
  Future<void> pause() async {
    await _flutterTts.pause();
  }
  
  bool get isSpeaking => _isSpeaking;

  String? _currentLanguage;

  /// Get the current language set in TTS
  String? get currentLanguage => _currentLanguage;

  /// Get list of available languages on the device
  Future<List<String>> getAvailableLanguages() async {
    if (!_isInitialized) {
      await initialize();
    }

    final List<dynamic> languages = await _flutterTts.getLanguages;
    return languages.map((lang) => lang.toString()).toList();
  }

  /// Check if a specific language is available on the device
  Future<bool> isLanguageAvailable(String languageCode) async {
    if (!_isInitialized) {
      await initialize();
    }

    print(languageCode);

    final List<String> availableLanguages = await getAvailableLanguages();

    // Check for exact match first
    if (availableLanguages.contains(languageCode)) {
      return true;
    }

    // Check for language code variations (e.g., "hi" vs "hi-IN")
    final baseCode = languageCode.split('-').first.toLowerCase();
    for (final lang in availableLanguages) {
      if (lang.toLowerCase().startsWith(baseCode)) {
        return true;
      }
    }

    return false;
  }

  Future<void> setLanguage(String language) async {
    if (!_isInitialized) {
      await initialize();
    }

    final List<dynamic> languages = await _flutterTts.getLanguages;

    try {
      // Try to set the requested language
      await _flutterTts.setLanguage(language);
      _currentLanguage = language;
    } catch (e) {
      // Fallback to English if the requested language is not supported
      try {
        await _flutterTts.setLanguage("en-US");
        _currentLanguage = "en-US";
      } catch (_) {
        // If English also fails, try any available language
        if (languages.isNotEmpty) {
          await _flutterTts.setLanguage(languages.first as String);
          _currentLanguage = languages.first as String;
        }
      }
    }
  }
  
  Future<void> setSpeechRate(double rate) async {
    await _flutterTts.setSpeechRate(rate);
  }
  
  Future<void> setVolume(double volume) async {
    await _flutterTts.setVolume(volume);
  }
  
  Future<void> setPitch(double pitch) async {
    await _flutterTts.setPitch(pitch);
  }
  
  void dispose() {
    _flutterTts.stop();
    _isSpeaking = false;
  }
}