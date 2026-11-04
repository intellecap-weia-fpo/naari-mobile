enum SurveyMode {
  manual('Manual Mode (No Internet Required)'),
  audioQuestions('Audio based Questions (No Internet Required)');

  const SurveyMode(this.displayName);

  final String displayName;
  
  String get urlName {
    switch (this) {
      case SurveyMode.manual:
        return 'manual';
      case SurveyMode.audioQuestions:
        return 'audio-questions';
    }
  }
  
  bool get requiresInternet => false;

  /// Voice answers are off in this release; questions can still be read aloud.
  bool get speaksAnswers => false;
  
  bool get hasVoice {
    return this != manual;
  }

  static SurveyMode? fromString(String? mode) {
    if (mode == null) return null;
    
    // First try to match by urlName (new way)
    for (final surveyMode in SurveyMode.values) {
      if (surveyMode.urlName == mode) {
        return surveyMode;
      }
    }
    
    // Fallback to displayName (old way)
    for (final surveyMode in SurveyMode.values) {
      if (surveyMode.displayName == mode) {
        return surveyMode;
      }
    }
    return null;
  }
}