// Language utility for handling multiple Indian languages
class LanguageUtils {
  // Supported Indian language codes
  static const Map<String, String> supportedLanguages = {
    'en': 'English',
    'hi': 'Hindi',
    'as': 'Assamese',
    'bn': 'Bengali',
    'gu': 'Gujarati',
    'kn': 'Kannada',
    'kok': 'Konkani',
    'mai': 'Maithili',
    'ml': 'Malayalam',
    'mni': 'Manipuri',
    'mr': 'Marathi',
    'or': 'Odia',
    'pa': 'Punjabi',
    'ta': 'Tamil',
    'te': 'Telugu',
  };

  // Check if a language code is supported
  static bool isSupportedLanguage(String languageCode) {
    return supportedLanguages.containsKey(languageCode.toLowerCase());
  }

  // Get the language name from code
  static String? getLanguageName(String languageCode) {
    return supportedLanguages[languageCode.toLowerCase()];
  }

  // Check if language is English
  static bool isEnglish(String languageCode) {
    return languageCode.toLowerCase() == 'en';
  }

  // Check if language is Hindi
  static bool isHindi(String languageCode) {
    return languageCode.toLowerCase() == 'hi';
  }

  // Check if language is Marathi
  static bool isMarathi(String languageCode) {
    return languageCode.toLowerCase() == 'mr';
  }

  // Check if language is Telugu
  static bool isTelugu(String languageCode) {
    return languageCode.toLowerCase() == 'te';
  }

  // Check if language is Tamil
  static bool isTamil(String languageCode) {
    return languageCode.toLowerCase() == 'ta';
  }

  // Check if language is Malayalam
  static bool isMalayalam(String languageCode) {
    return languageCode.toLowerCase() == 'ml';
  }

  // Check if language is Kannada
  static bool isKannada(String languageCode) {
    return languageCode.toLowerCase() == 'kn';
  }

  // Check if language is Gujarati
  static bool isGujarati(String languageCode) {
    return languageCode.toLowerCase() == 'gu';
  }

  // Check if language is any Indian language (non-English)
  static bool isIndianLanguage(String languageCode) {
    final code = languageCode.toLowerCase();
    return code == 'hi' ||
        code == 'as' ||
        code == 'bn' ||
        code == 'mr' ||
        code == 'te' ||
        code == 'ta' ||
        code == 'ml' ||
        code == 'kn' ||
        code == 'gu' ||
        code == 'kok' ||
        code == 'mai' ||
        code == 'mni' ||
        code == 'or' ||
        code == 'pa';
  }

  // Get TTS language code for a given language
  static String getTTSLanguageCode(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case 'hi':
        return 'hi-IN'; // Hindi (India)
      case 'as':
        return 'as-IN'; // Assamese (India)
      case 'bn':
        return 'bn-IN'; // Bengali (India)
      case 'gu':
        return 'gu-IN'; // Gujarati (India)
      case 'kn':
        return 'kn-IN'; // Kannada (India)
      case 'kok':
        return 'kok-IN'; // Konkani (India)
      case 'ml':
        return 'ml-IN'; // Malayalam (India)
      case 'mni':
        return 'mni-IN'; // Manipuri (India)
      case 'mr':
        return 'mr-IN'; // Marathi (India)
      case 'or':
        return 'or-IN'; // Odia (India)
      case 'pa':
        return 'pa-IN'; // Punjabi (India)
      case 'ta':
        return 'ta-IN'; // Tamil (India)
      case 'te':
        return 'te-IN'; // Telugu (India)
      // For languages without specific TTS codes, fallback to Hindi or English
      case 'mai':
        return 'hi-IN'; // Fallback to Hindi
      default:
        return 'en-US'; // English (US) - default
    }
  }

  // Get localized text based on language
  static String getLocalizedText({
    required String languageCode,
    required Map<String, String> translations,
    required String fallbackText,
  }) {
    final code = languageCode.toLowerCase();

    // Return the translation for the specific language if available
    if (translations.containsKey(code)) {
      final translation = translations[code]?.trim();
      if (translation != null && translation.isNotEmpty) {
        return translation;
      }
    }

    // Fallback to English if available
    if (translations.containsKey('en')) {
      final englishTranslation = translations['en']?.trim();
      if (englishTranslation != null && englishTranslation.isNotEmpty) {
        return englishTranslation;
      }
    }

    // Final fallback
    return fallbackText;
  }

  // Translation for consent agreement title
  static String getConsentAgreementTitle(String languageCode) {
    const translations = {
      'en': 'Consent Agreement',
      'hi': 'सहमति समझौता',
      'as': 'সন্মতি চুক্তি',
      'bn': 'সম্মতি চুক্তি',
      'brx': 'सम्मति थार',
      'doi': 'सहमति समझौता',
      'gu': 'સંમતિ કરાર',
      'kn': 'ಸಮ್ಮತಿ ಒಪ್ಪಂದಂ',
      'kok': 'थार',
      'ks': 'मुबाहिथा इज़रातनामा',
      'mai': 'सहमति समझौता',
      'ml': 'സമ്മത കരാർ',
      'mni': 'অনুমতি থৌবা',
      'mr': 'संमती करार',
      'ne': 'सहमति सम्झौता',
      'or': 'ସମ୍ମତି ଚୁକ୍ତି',
      'pa': 'ਸਹਿਮਤੀ ਇਕਰਾਰਨਾਮਾ',
      'sa': 'अनुमति पत्रम्',
      'sat': 'मत साझा कराव',
      'sd': 'سختی معاہدو',
      'ta': 'ஒப்பந்த ஒப்புதல்',
      'te': 'అంగీకార ఒప్పందం',
      'ur': 'رضامنامہ',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Consent Agreement',
    );
  }

  // Translation for "Cancel" button
  static String getCancelText(String languageCode) {
    const translations = {
      'en': 'Cancel',
      'hi': 'रद्द करें',
      'as': 'বাতিল কৰক',
      'bn': 'বাতিল করুন',
      'brx': 'खाराय',
      'doi': 'रद्द करो',
      'gu': 'રદ કરો',
      'kn': 'ರದ್ದುಮಾಡಿ',
      'kok': 'रद्द कर',
      'ks': 'منسوخ کریہ',
      'mai': 'रद्द करू',
      'ml': 'റദ്ദാക്കുക',
      'mni': 'লাউখ্রিবা',
      'mr': 'रद्द करा',
      'ne': 'रद्द गर्नुहोस्',
      'or': 'ବାତିଲ କରନ୍ତୁ',
      'pa': 'ਰੱਦ ਕਰੋ',
      'sa': 'त्यागं कुरु',
      'sat': 'बातिल करब',
      'sd': 'منسوخ ڪريو',
      'ta': 'ரத்து செய்',
      'te': 'రద్దు చేయండి',
      'ur': 'منسوخ کریں',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Cancel',
    );
  }

  // Translation for "I Agree" button
  static String getAgreeText(String languageCode) {
    const translations = {
      'en': 'I Agree',
      'hi': 'मैं सहमत हूं',
      'as': 'মই সন্মত',
      'bn': 'আমি সম্মত',
      'brx': 'आङि सम्मत',
      'doi': 'मैं सहमत',
      'gu': 'હું સંમત છું',
      'kn': 'ನಾನು ಒಪ್ಪುತ್ತೇನೆ',
      'kok': 'हांव सम्मत',
      'ks': 'मैं सहमत छु',
      'mai': 'मइ सहमत अछि',
      'ml': 'ഞാൻ അംഗീകരിക്കുന്നു',
      'mni': 'অহানবা মতমা',
      'mr': 'मी सहमत आहे',
      'ne': 'म सहमत छु',
      'or': 'ମୁଁ ସମ୍ମତ',
      'pa': 'ਮੈਂ ਸਹਿਮਤ ਹਾਂ',
      'sa': 'अहं स्वीकुरोमि',
      'sat': 'मँ सहमत',
      'sd': 'مان راضي آهيان',
      'ta': 'நான் ஒப்புக்கொள்கிறேன்',
      'te': 'నేను అంగీకరిస్తున్నాను',
      'ur': 'میں متفق ہوں',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'I Agree',
    );
  }

  // Translation for "Which mode do you want to use to conduct the survey?"
  static String getSurveyModeQuestion(String languageCode) {
    const translations = {
      'en': 'Which mode do you want to use to conduct the survey?',
      'hi': 'सर्वेक्षण करने के लिए आप किस मोड का उपयोग करना चाहते हैं?',
      'as': 'আপুনি কেৱেণ্ট মোড ব্যৱহাৰ কৰিব বিচাৰে চার্ভে কৰিবলৈ?',
      'bn': 'আপনি কোন মোড ব্যবহার করতে চান সার্ভে করার জন্য?',
      'brx': 'नोनि सार्भे खालामनो आं बे मोडखौ बाहायनो लुबैयो?',
      'doi': 'तुस�र्वे किस मोड दा इस्तेमाल करना चांदे सर्वे करने लाई?',
      'gu': 'તમે સર્વે કરવા માટે કઈ મોડનો ઉપયોગ કરવા માંગો છો?',
      'kn': 'ಸರ್ವೇಯನ್ನು ನಡೆಸಲು ನೀವು ಯಾವ ಮೋಡ್ ಅನ್ನು ಬಳಸಲು ಬಯಸುತ್ತೀರಿ?',
      'kok': 'तुमी सर्वेक्षण करपाक खाती कोणत्या मोडाचो वापर करूंक जाय?',
      'ks': 'تہیہ کِس موڈ کا استعمال کرنا چاہندے ہیں سروے کرنے کے لیے؟',
      'mai': 'सर्वेक्षण करबाक लेल अहाँ कओन मोड क उपयोग करबा चाहैत छी?',
      'ml': 'സർവേ നടത്തുന്നതിന് നിങ്ങൾ ഏത് മോഡ് ഉപയോഗിക്കാനാണ് ആഗ്രഹിക്കുന്നത്?',
      'mni': 'অমসুং অমা সার্ভে খোঙবগীদি কোন্না মোদখৌ শীজিন্নবা খাংদ্রে?',
      'mr': 'सर्वेक्षण आयोजित करण्यासाठी तुम्ही कोणता मोड वापरू इच्छिता?',
      'ne': 'तपाईं सर्वे गर्न कुन मोड प्रयोग गर्न चाहनुहुन्छ?',
      'or': 'ଆପଣ ସର୍ଭେ କରିବା ପାଇଁ କେଉଁ ମୋଡ୍ ବ୍ୟବହାର କରିବାକୁ ଚାହାଁନ୍ତି?',
      'pa': 'ਤੁਸੀਂ ਸਰਵੇਕਸ਼ਣ ਕਰਨ ਲਈ ਕਿਸ ਮੋਡ ਦੀ ਵਰਤੋਂ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
      'sa': 'भवन्तः केन मोडेन् सर्वेक्षणं कर्तुं इच्छन्ति?',
      'sat': 'आपन सार्वे कराव लागि केहुन मोड बाबेहार करब चाहू?',
      'sd': 'توهان سروي ڪرڻ لاءِ ڪهڙي موڊ استعمال ڪرڻ چاهيو ٿا؟',
      'ta': 'கருத்துக் கணக்கெடுப்பை நடத்த எந்த முறையைப் பயன்படுத்த விரும்புகிறீர்கள்?',
      'te': 'సర్వేను నిర్వహించడానికి మీరు ఏ మోడ్‌ను ఉపయోగించాలనుకుంటున్నారు?',
      'ur': 'آپ سروے کرنے کے لیے کس موڈ کا استعمال کرنا چاہتے ہیں؟',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Which mode do you want to use to conduct the survey?',
    );
  }

  // Survey mode title translations
  static String getManualModeTitle(String languageCode) {
    const translations = {
      'en': 'Manual Mode',
      'hi': 'मैनुअल मोड',
      'as': 'মেনুৱেল মোড',
      'bn': 'ম্যানুয়াল মোড',
      'brx': 'मेनुअल मोड',
      'doi': 'मैनुअल मोड',
      'gu': 'મેન્યુઅલ મોડ',
      'kn': 'ಹಸ್ತಚಾಲಿತ ಮೋಡ್',
      'kok': 'मॅन्युअल मोड',
      'ks': 'مینیول موڈ',
      'mai': 'मैनुअल मोड',
      'ml': 'മാനുവൽ മോഡ്',
      'mni': 'মেনুৱেল মোদ',
      'mr': 'मॅन्युअल मोड',
      'ne': 'म्यानुअल मोड',
      'or': 'ମାନୁଆଲ୍ ମୋଡ୍',
      'pa': 'ਮੈਨੂਅਲ ਮੋਡ',
      'sa': 'स्वचालितः मोडः',
      'sat': 'मेनुअल मोड',
      'sd': 'مانئل موڊ',
      'ta': 'கையேடு முறை',
      'te': 'మాన్యువల్ మోడ్',
      'ur': ' دستی موڈ',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Manual Mode',
    );
  }

  static String getAudioQuestionsModeTitle(String languageCode) {
    const translations = {
      'en': 'Audio based Questions',
      'hi': 'ऑडियो आधारित प्रश्न',
      'as': 'অডিঅ\' আধাৰিত প্ৰশ্ন',
      'bn': 'অডিও ভিত্তিক প্রশ্ন',
      'brx': 'अडियो आधारित प्रश्न',
      'doi': 'आडियो आधारित सवाल',
      'gu': 'ઓડિયો આધારિત પ્રશ્નો',
      'kn': 'ಆಡಿಯೊ ಆಧಾರಿತ ಪ್ರಶ್ನೆಗಳು',
      'kok': 'ऑडिओ आधारित प्रश्न',
      'ks': 'آڈیو مبنی سوالات',
      'mai': 'आडियो आधारित प्रश्न',
      'ml': 'ഓഡിയോ അടിസ്ഥാനമായ ചോദ്യങ്ങൾ',
      'mni': 'অডিঅ\' আধাৰিত প্রশ্ন',
      'mr': 'ऑडिओ आधारित प्रश्ने',
      'ne': 'अडियो आधारित प्रश्नहरू',
      'or': 'ଅଡିଓ ଆଧାରିତ ପ୍ରଶ୍ନ',
      'pa': 'ਆਡੀਓ ਅਧਾਰਤ ਸਵਾਲ',
      'sa': 'ध्वन्याधारिताः प्रश्नाः',
      'sat': 'आडियो आधारित सवाल',
      'sd': 'آڊيو بيښ سوال',
      'ta': 'ஒலிப்பதிவு அடிப்படையிலான கேள்விகள்',
      'te': 'ఆడియో ఆధారిత ప్రశ్నలు',
      'ur': 'آڈیو بیسڈ سوالات',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Audio based Questions',
    );
  }

  static String getAudioQAndAModeTitle(String languageCode) {
    const translations = {
      'en': 'Audio based Questions & Answers',
      'hi': 'ऑडियो आधारित प्रश्न और उत्तर',
      'as': 'অডিঅ\' আধাৰিত প্ৰশ্ন আৰু উত্তৰ',
      'bn': 'অডিও ভিত্তিক প্রশ্ন ও উত্তর',
      'brx': 'अडियो आधारित प्रश्न आरो उत्तर',
      'doi': 'आडियो आधारित सवाल ते जवाब',
      'gu': 'ઓડિયો આધારિત પ્રશ્નો અને જવાબો',
      'kn': 'ಆಡಿಯೊ ಆಧಾರಿತ ಪ್ರಶ್ನೆಗಳು ಮತ್ತು ಉತ್ತರಗಳು',
      'kok': 'ऑडिओ आधारित प्रश्न आणि उत्तर',
      'ks': 'آڈیو مبنی سوالات اور جوابات',
      'mai': 'आडियो आधारित प्रश्न आओर उत्तर',
      'ml': 'ഓഡിയോ അടിസ്ഥാനമായ ചോദ്യങ്ങളും ഉത്തരങ്ങളും',
      'mni': 'অডিঅ\' আধাৰিত প্রশ্ন অমসুং উত্তৰ',
      'mr': 'ऑडिओ आधारित प्रश्ने आणि उत्तरे',
      'ne': 'अडियो आधारित प्रश्न र उत्तरहरू',
      'or': 'ଅଡିଓ ଆଧାରିତ ପ୍ରଶ୍ନ ଏବଂ ଉତ୍ତର',
      'pa': 'ਆਡੀਓ ਅਧਾਰਤ ਸਵਾਲ ਅਤੇ ਜਵਾਬ',
      'sa': 'ध्वन्याधारिताः प्रश्नाः उत्तराणि च',
      'sat': 'आडियो आधारित सवाल आर जवाब',
      'sd': 'آڊيو بيښ سوال ۽ جواب',
      'ta': 'ஒலிப்பதிவு அடிப்படையிலான கேள்விகள் மற்றும் பதில்கள்',
      'te': 'ఆడియో ఆధారిత ప్రశ్నలు మరియు సమాధానాలు',
      'ur': 'آڈیو بیسڈ سوالات اور جوابات',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Audio based Questions & Answers',
    );
  }

  static String getAudioAnswersModeTitle(String languageCode) {
    const translations = {
      'en': 'Audio-based Answers',
      'hi': 'ऑडियो आधारित उत्तर',
      'as': 'অডিঅ\' আধাৰিত উত্তৰ',
      'bn': 'অডিও ভিত্তিক উত্তর',
      'brx': 'अडियो आधारित उत्तर',
      'doi': 'आडियो आधारित जवाब',
      'gu': 'ઓડિયો આધારિત જવાબો',
      'kn': 'ಆಡಿಯೊ ಆಧಾರಿತ ಉತ್ತರಗಳು',
      'kok': 'ऑडिओ आधारित उत्तर',
      'ks': 'آڈیو مبنی جوابات',
      'mai': 'आडियो आधारित उत्तर',
      'ml': 'ഓഡിയോ അടിസ്ഥാനമായ ഉത്തരങ്ങൾ',
      'mni': 'অডিঅ\' আধাৰিত উত্তৰ',
      'mr': 'ऑडिओ आधारित उत्तरे',
      'ne': 'अडियो आधारित उत्तरहरू',
      'or': 'ଅଡିଓ ଆଧାରିତ ଉତ୍ତର',
      'pa': 'ਆਡੀਓ ਅਧਾਰਤ ਜਵਾਬ',
      'sa': 'ध्वन्याधारिताः उत्तराणि',
      'sat': 'आडियो आधारित जवाब',
      'sd': 'آڊيو بيښ جواب',
      'ta': 'ஒலிப்பதிவு அடிப்படையிலான பதில்கள்',
      'te': 'ఆడియో ఆధారిత సమాధానాలు',
      'ur': 'آڈیو بیسڈ جوابات',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Audio-based Answers',
    );
  }

  // Survey mode subtitle translations
  static String getNoInternetRequiredText(String languageCode) {
    const translations = {
      'en': 'No Internet Required',
      'hi': 'इंटरनेट की आवश्यकता नहीं',
      'as': 'ইন্টাৰনেটৰ প্ৰয়োজন নাই',
      'bn': 'ইন্টারনেটের প্রয়োজন নেই',
      'brx': 'इन्टरनेटनो गोरोन्थि नाङा',
      'doi': 'इंटरनेट दी लोड़ नेईं',
      'gu': 'ઇન્ટરનેટની જરૂર નથી',
      'kn': 'ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿಲ್ಲ',
      'kok': 'इंटरनेटाची गरज ना',
      'ks': 'انٹرنیٹ کی ضرورت نہیں',
      'mai': 'इंटरनेटक आवश्यकता नहि',
      'ml': 'ഇന്റർനെറ്റ് ആവശ്യമില്ല',
      'mni': 'ইন্টাৰনেতনী অৱা ঙাইদোনা',
      'mr': 'इंटरनेटची आवश्यकता नाही',
      'ne': 'इन्टरनेट आवश्यक पर्दैन',
      'or': 'ଇଣ୍ଟରନେଟ୍ ଆବଶ୍ୟକ ନୁହେଁ',
      'pa': 'ਇੰਟਰਨੈੱਟ ਦੀ ਲੋੜ ਨਹੀਂ',
      'sa': 'अन्तर्जालस्य आवश्यकता नास्ति',
      'sat': 'इंटरनेट लागत नाही',
      'sd': 'انٽرنيٽ جي ضرورت ناهي',
      'ta': 'இணையம் தேவையில்லை',
      'te': 'ఇంటర్నెట్ అవసరం లేదు',
      'ur': 'انٹرنیٹ کی ضرورت نہیں',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'No Internet Required',
    );
  }

  static String getInternetRequiredText(String languageCode) {
    const translations = {
      'en': 'Internet Required',
      'hi': 'इंटरनेट की आवश्यकता है',
      'as': 'ইন্টাৰনেটৰ প্ৰয়োজন',
      'bn': 'ইন্টারনেটের প্রয়োজন',
      'brx': 'इन्टरनेटनो गोरोन्थि आ',
      'doi': 'इंटरनेट दी लोड़ है',
      'gu': 'ઇન્ટરનેટની જરૂર',
      'kn': 'ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯ',
      'kok': 'इंटरनेटाची गरज आसा',
      'ks': 'انٹرنیٹ کی ضرورت ہے',
      'mai': 'इंटरनेटक आवश्यकता अछि',
      'ml': 'ഇന്റർനെറ്റ് ആവശ്യമാണ്',
      'mni': 'ইন্টাৰনেতনী অৱा ङাইদো',
      'mr': 'इंटरनेटची आवश्यकता आहे',
      'ne': 'इन्टरनेट आवश्यक छ',
      'or': 'ଇଣ୍ଟରନେଟ୍ ଆବଶ୍ୟକ',
      'pa': 'ਇੰਟਰਨੈੱਟ ਦੀ ਲੋੜ ਹੈ',
      'sa': 'अन्तर्जालस्य आवश्यकता अस्ति',
      'sat': 'इंटरनेट लागत बा',
      'sd': 'انٽرنيٽ جي ضرورت آهي',
      'ta': 'இணையம் தேவைப்படுகிறது',
      'te': 'ఇంటర్నెట్ అవసరం',
      'ur': 'انٹرنیٹ کی ضرورت ہے',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Internet Required',
    );
  }

  // Survey mode feature translations
  static String getVoiceQuestionsText(String languageCode) {
    const translations = {
      'en': 'Voice questions',
      'hi': 'आवाज प्रश्न',
      'as': 'কণ্ঠস্বৰ প্ৰশ্ন',
      'bn': 'ভয়েস প্রশ্ন',
      'brx': 'आवाज प्रश्न',
      'doi': 'आवाज सवाल',
      'gu': 'અવાજ પ્રશ્નો',
      'kn': 'ಧ್ವನಿ ಪ್ರಶ್ನೆಗಳು',
      'kok': 'आवाज प्रश्न',
      'ks': 'آوازی سوالات',
      'mai': 'आवाज प्रश्न',
      'ml': 'ശബ്ദ ചോദ്യങ്ങൾ',
      'mni': 'অবা প্রশ্ন',
      'mr': 'आवाज प्रश्ने',
      'ne': 'आवाज प्रश्नहरू',
      'or': 'କଣ୍ଠସ୍ଵର ପ୍ରଶ୍ନ',
      'pa': 'ਆਵਾਜ਼ ਸਵਾਲ',
      'sa': 'ध्वनिः प्रश्नाः',
      'sat': 'आवाज सवाल',
      'sd': 'آواز سوال',
      'ta': 'குரல் கேள்விகள்',
      'te': 'వాయిస్ ప్రశ్నలు',
      'ur': 'آواز والے سوال',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Voice questions',
    );
  }

  static String getVoiceAnswersText(String languageCode) {
    const translations = {
      'en': 'Voice answers',
      'hi': 'आवाज उत्तर',
      'as': 'কণ্ঠস্বৰ উত্তৰ',
      'bn': 'ভয়েস উত্তর',
      'brx': 'आवाज उत्तर',
      'doi': 'आवाज जवाब',
      'gu': 'અવાજ જવાબો',
      'kn': 'ಧ್ವನಿ ಉತ್ತರಗಳು',
      'kok': 'आवाज उत्तर',
      'ks': 'آوازی جوابات',
      'mai': 'आवाज उत्तर',
      'ml': 'ശബ്ദ ഉത്തരങ്ങൾ',
      'mni': 'অবা উত্তৰ',
      'mr': 'आवाज उत्तरे',
      'ne': 'आवाज उत्तरहरू',
      'or': 'କଣ୍ଠସ୍ଵର ଉତ୍ତର',
      'pa': 'ਆਵਾਜ਼ ਜਵਾਬ',
      'sa': 'ध्वनिः उत्तराणि',
      'sat': 'आवाज जवाब',
      'sd': 'آواز جواب',
      'ta': 'குரல் பதில்கள்',
      'te': 'వాయిస్ సమాధానాలు',
      'ur': 'آواز والے جواب',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Voice answers',
    );
  }

  // Translation for "Language Not Available" title
  static String getLanguageNotAvailableTitle(String languageCode) {
    const translations = {
      'en': 'Language Voice Not Available',
      'hi': 'भाषा की आवाज़ उपलब्ध नहीं है',
      'as': 'ভাষাৰ কণ্ঠস্বৰ উপলব্ধ নহয়',
      'bn': 'ভাষার ভয়েস উপলব্ধ নয়',
      'brx': 'भाषाव आवाज नाङै',
      'doi': 'भाषा दी आवाज़ उपलब्ध नेईं',
      'gu': 'ભાષાનો અવાજ ઉપલબ્ધ નથી',
      'kn': 'ಭಾಷೆಯ ಧ್ವನಿ ಲಭ್ಯವಿಲ್ಲ',
      'kok': 'भाशेची आवाज उपलब्ध ना',
      'ks': 'زبانُک آواز دستیاب چھُ نہ',
      'mai': 'भाषाक आवाज उपलब्ध नहि',
      'ml': 'ഭാഷയുടെ ശബ്ദം ലഭ്യമല്ല',
      'mni': 'লোন্না অবা ফংদোক্লে',
      'mr': 'भाषेचा आवाज उपलब्ध नाही',
      'ne': 'भाषाको आवाज उपलब्ध छैन',
      'or': 'ଭାଷାର ସ୍ୱର ଉପଲବ୍ଧ ନାହିଁ',
      'pa': 'ਭਾਸ਼ਾ ਦੀ ਆਵਾਜ਼ ਉਪਲਬਧ ਨਹੀਂ',
      'sa': 'भाषायाः ध्वनिः नास्ति',
      'sat': 'भासाय आवाज नाहान',
      'sd': 'ٻوليءَ جو آواز موجود ناهي',
      'ta': 'மொழியின் குரல் கிடைக்கவில்லை',
      'te': 'భాష వాయిస్ అందుబాటులో లేదు',
      'ur': 'زبان کی آواز دستیاب نہیں',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Language Voice Not Available',
    );
  }

  // Translation for "Got it" button
  static String getGotItText(String languageCode) {
    const translations = {
      'en': 'Got it',
      'hi': 'समझ गया',
      'as': 'বুজি পালোঁ',
      'bn': 'বুঝেছি',
      'brx': 'गोबां होदों',
      'doi': 'समझ गेआ',
      'gu': 'સમજાઈ ગયું',
      'kn': 'ಅರ್ಥವಾಯಿತು',
      'kok': 'कळलें',
      'ks': 'سَمَجھ گٔے',
      'mai': 'बुझलहुं',
      'ml': 'മനസ്സിലായി',
      'mni': 'খংলে',
      'mr': 'समजले',
      'ne': 'बुझे',
      'or': 'ବୁଝିଲି',
      'pa': 'ਸਮਝ ਗਿਆ',
      'sa': 'अवगतम्',
      'sat': 'बुझाव आकाना',
      'sd': 'سمجھ ويو',
      'ta': 'புரிந்தது',
      'te': 'అర్థమైంది',
      'ur': 'سمجھ گیا',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Got it',
    );
  }

  // Translation for language download message
  static String getLanguageDownloadMessage(String languageCode) {
    const translations = {
      'en': 'To use voice features in this language, you need to download the voice pack from your device settings.',
      'hi': 'इस भाषा में आवाज़ सुविधाओं का उपयोग करने के लिए, आपको अपने डिवाइस सेटिंग्स से आवाज़ पैक डाउनलोड करना होगा।',
      'as': 'এই ভাষাত কণ্ঠস্বৰ সুবিধাসমূহ ব্যৱহাৰ কৰিবলৈ, আপুনি আপোনাৰ ডিভাইচ ছেটিংছৰ পৰা কণ্ঠস্বৰ পেক ডাউনলোড কৰিব লাগিব।',
      'bn': 'এই ভাষায় ভয়েস বৈশিষ্ট্য ব্যবহার করতে, আপনাকে আপনার ডিভাইস সেটিংস থেকে ভয়েস প্যাক ডাউনলোড করতে হবে।',
      'brx': 'बे भाषाआव आवाज सुविधा बाहायनो थाखाय, नोनि डिभाइस सेटिंसानि थांनाय आवाज पेक डाउनलोड खालामनो लागोन।',
      'doi': 'इस भाषा च आवाज़ सुविधाएं दा इस्तेमाल करने लेई, तुसें गी अपने डिवाइस सेटिंग्स थमां आवाज़ पैक डाउनलोड करना पवेगा।',
      'gu': 'આ ભાષામાં વૉઇસ સુવિધાઓનો ઉપયોગ કરવા માટે, તમારે તમારા ઉપકરણ સેટિંગ્સમાંથી વૉઇસ પેક ડાઉનલોડ કરવાની જરૂર છે।',
      'kn': 'ಈ ಭಾಷೆಯಲ್ಲಿ ಧ್ವನಿ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಬಳಸಲು, ನಿಮ್ಮ ಸಾಧನ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ಧ್ವನಿ ಪ್ಯಾಕ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ।',
      'kok': 'ह्या भाशेन आवाज सुविधांचो उपेग करपाक, तुमकां तुमच्या डिव्हाईस सेटिंगांतल्यान आवाज पॅक डाउनलोड करचो पडटलो।',
      'ks': 'اَتھ زَبانَس مَنٛز آوازُک خصوصیات استعمال کرنہٕ باپت، توہہِ پَنُن ڈیوایِس سیٹِنگن پٮ۪ٹھٕ آواز پیک ڈاونلوڈ کرُن پَوِ۔',
      'mai': 'एहि भाषामे आवाज सुविधाक उपयोग करबाक लेल, अहाँकेँ अपन डिवाइस सेटिंगसँ आवाज पैक डाउनलोड करबाक आवश्यकता अछि।',
      'ml': 'ഈ ഭാഷയിൽ വോയ്‌സ് സവിശേഷതകൾ ഉപയോഗിക്കാൻ, നിങ്ങളുടെ ഉപകരണ ക്രമീകരണങ്ങളിൽ നിന്ന് വോയ്‌സ് പാക്ക് ഡൗൺലോഡ് ചെയ്യേണ്ടതുണ്ട്।',
      'mni': 'মসিগী লোন্দা অবানা ফীভম শীজিন্নবা, নহাক্না নহাক্কী দিভাইস সেত্তিংসদগী অবানা পেক তৌখ্রগদবনি।',
      'mr': 'या भाषेत आवाज वैशिष्ट्ये वापरण्यासाठी, तुम्हाला तुमच्या डिव्हाइस सेटिंग्जमधून आवाज पॅक डाउनलोड करणे आवश्यक आहे।',
      'ne': 'यो भाषामा आवाज सुविधाहरू प्रयोग गर्न, तपाईंले आफ्नो उपकरण सेटिङहरूबाट आवाज प्याक डाउनलोड गर्नुपर्छ।',
      'or': 'ଏହି ଭାଷାରେ ଭଏସ୍ ବୈଶିଷ୍ଟ୍ୟ ବ୍ୟବହାର କରିବାକୁ, ଆପଣଙ୍କୁ ଆପଣଙ୍କ ଉପକରଣ ସେଟିଂସମାନଙ୍କରୁ ଭଏସ୍ ପ୍ୟାକ୍ ଡାଉନଲୋଡ୍ କରିବାକୁ ପଡିବ।',
      'pa': 'ਇਸ ਭਾਸ਼ਾ ਵਿੱਚ ਆਵਾਜ਼ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ, ਤੁਹਾਨੂੰ ਆਪਣੀ ਡਿਵਾਈਸ ਸੈਟਿੰਗਾਂ ਤੋਂ ਆਵਾਜ਼ ਪੈਕ ਡਾਊਨਲੋਡ ਕਰਨ ਦੀ ਲੋੜ ਹੈ।',
      'sa': 'अस्मिन् भाषायां ध्वनि-विशेषतानां उपयोगाय भवतः उपकरण-सेटिङ्ग्स् इत्यस्मात् ध्वनि-पैकं डाउनलोडं कर्तव्यम्।',
      'sat': 'नित भासाय रे आवाज सुविधा बाबार लागि, आप आपनाक डिभाइस सेटिङ सथाव आवाज पैक डाउनलोड लागत बा।',
      'sd': 'هن ٻوليءَ ۾ آواز جون خاصيتون استعمال ڪرڻ لاءِ، توهان کي پنهنجي ڊيوائس سيٽنگس مان آواز پيڪ ڊائون لوڊ ڪرڻ جي ضرورت آهي।',
      'ta': 'இந்த மொழியில் குரல் அம்சங்களைப் பயன்படுத்த, உங்கள் சாதன அமைப்புகளிலிருந்து குரல் தொகுப்பைப் பதிவிறக்க வேண்டும்.',
      'te': 'ఈ భాషలో వాయిస్ ఫీచర్‌లను ఉపయోగించడానికి, మీరు మీ పరికర సెట్టింగ్‌ల నుండి వాయిస్ ప్యాక్‌ని డౌన్‌లోడ్ చేయాలి।',
      'ur': 'اس زبان میں آواز کی خصوصیات استعمال کرنے کے لیے، آپ کو اپنی ڈیوائس کی ترتیبات سے آواز پیک ڈاؤن لوڈ کرنا ہوگا۔',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'To use voice features in this language, you need to download the voice pack from your device settings.',
    );
  }

  // Translation for "Selected" (when an option is selected)
  static String getSelectedText(String languageCode) {
    const translations = {
      'en': 'Selected',
      'hi': 'चयनित',
      'as': 'নিৰ্বাচিত',
      'bn': 'নির্বাচিত',
      'brx': 'सायख',
      'doi': 'चयनित',
      'gu': 'પસંદ કરેલ',
      'kn': 'ಆಯ್ಕೆ ಮಾಡಲಾಗಿದೆ',
      'kok': 'निवडिल',
      'ks': 'منتخب',
      'mai': 'चयनित',
      'ml': 'തിരഞ്ഞെടുത്തു',
      'mni': 'খন্নবা',
      'mr': 'निवडले',
      'ne': 'चयनित',
      'or': 'ବାଛିଲେ',
      'pa': 'ਚੁਣਿਆ',
      'sa': 'चितम्',
      'sat': 'साय आकाना',
      'sd': 'چونڊيل',
      'ta': 'தேர்ந்தெடுக்கப்பட்டது',
      'te': 'ఎంపిక చేయబడింది',
      'ur': 'منتخب',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Selected',
    );
  }

  // Translation for "Deselected" (when an option is deselected)
  static String getDeselectedText(String languageCode) {
    const translations = {
      'en': 'Deselected',
      'hi': 'अचयनित',
      'as': 'অনিৰ্বাচিত',
      'bn': 'অনির্বাচিত',
      'brx': 'सायनि हाया',
      'doi': 'अचयनित',
      'gu': 'પસંદગી રદ',
      'kn': 'ಆಯ್ಕೆ ರದ್ದು',
      'kok': 'निवड काडिल',
      'ks': 'غیر منتخب',
      'mai': 'अचयनित',
      'ml': 'തിരഞ്ഞെടുപ്പ് ഒഴിവാക്കി',
      'mni': 'খন্দোক্তে',
      'mr': 'निवड रद्द',
      'ne': 'अचयनित',
      'or': 'ବାଛିବା ରଦ୍ଦ',
      'pa': 'ਚੋਣ ਰੱਦ',
      'sa': 'अचितम्',
      'sat': 'साय बातिल',
      'sd': 'چونڊ رد',
      'ta': 'தேர்வு நீக்கம்',
      'te': 'ఎంపిక రద్దు',
      'ur': 'غیر منتخب',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Deselected',
    );
  }

  // Translation for "Option" (prefix for options)
  static String getOptionText(String languageCode) {
    const translations = {
      'en': 'Option',
      'hi': 'विकल्प',
      'as': 'বিকল্প',
      'bn': 'বিকল্প',
      'brx': 'बिखौ',
      'doi': 'विकल्प',
      'gu': 'વિકલ્પ',
      'kn': 'ಆಯ್ಕೆ',
      'kok': 'पर्याय',
      'ks': 'اختیار',
      'mai': 'विकल्प',
      'ml': 'ഓപ്ഷൻ',
      'mni': 'খোঙবা',
      'mr': 'पर्याय',
      'ne': 'विकल्प',
      'or': 'ବିକଳ୍ପ',
      'pa': 'ਚੋਣ',
      'sa': 'विकल्पः',
      'sat': 'बिखोव',
      'sd': 'اختيار',
      'ta': 'விருப்பம்',
      'te': 'ఎంపిక',
      'ur': 'اختیار',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Option',
    );
  }

  // Translation for instruction to tap options to hear them
  static String getTapOptionsInstruction(String languageCode) {
    const translations = {
      'en': 'Tap on options to hear them read aloud.',
      'hi': 'विकल्पों को सुनने के लिए उन पर टैप करें।',
      'as': 'সিহঁতক শুনিবলৈ বিকল্পসমূহত টেপ কৰক।',
      'bn': 'সেগুলি শুনতে বিকল্পগুলিতে ট্যাপ করুন।',
      'brx': 'बिखौफोरखौ थागो थाखाय बिखौफोरजों टेप खालाम।',
      'doi': 'विकल्पां गी सुनने लेई उंदे उप्पर टैप करो।',
      'gu': 'તેમને સાંભળવા માટે વિકલ્પો પર ટેપ કરો.',
      'kn': 'ಅವುಗಳನ್ನು ಕೇಳಲು ಆಯ್ಕೆಗಳ ಮೇಲೆ ಟ್ಯಾಪ್ ಮಾಡಿ.',
      'kok': 'तांकां ऐकपाक पर्यायांचेर टॅप कर.',
      'ks': 'تِم بۄزنہٕ باپَتھ اختیارن پؠٹھ ٹیپ کَرِو۔',
      'mai': 'ओकरा सुनबाक लेल विकल्पसभ पर टैप करू।',
      'ml': 'അവ കേൾക്കാൻ ഓപ്ഷനുകളിൽ ടാപ്പ് ചെയ്യുക.',
      'mni': 'মখোয়বু তানবগীদমক খোঙবাশীংদা টেপ তৌবীয়ু।',
      'mr': 'त्यांना ऐकण्यासाठी पर्यायांवर टॅप करा.',
      'ne': 'तिनीहरूलाई सुन्न विकल्पहरूमा ट्याप गर्नुहोस्।',
      'or': 'ସେମାନଙ୍କୁ ଶୁଣିବାକୁ ବିକଳ୍ପଗୁଡ଼ିକରେ ଟ୍ୟାପ୍ କରନ୍ତୁ।',
      'pa': 'ਉਹਨਾਂ ਨੂੰ ਸੁਣਨ ਲਈ ਵਿਕਲਪਾਂ \'ਤੇ ਟੈਪ ਕਰੋ।',
      'sa': 'तान् श्रोतुं विकल्पेषु स्पृशतु।',
      'sat': 'उनुकुआ लागि बिखोव रे टेप करब।',
      'sd': 'انهن کي ٻڌڻ لاءِ اختيارن تي ٽيپ ڪريو.',
      'ta': 'அவற்றைக் கேட்க விருப்பங்களில் தட்டவும்.',
      'te': 'వాటిని వినడానికి ఎంపికలపై ట్యాప్ చేయండి.',
      'ur': 'انہیں سننے کے لیے اختیارات پر ٹیپ کریں۔',
    };
    return getLocalizedText(
      languageCode: languageCode,
      translations: translations,
      fallbackText: 'Tap on options to hear them read aloud.',
    );
  }

  // Get iOS/Android instructions title
  static String getInstructionsForIOS(String languageCode) {
    // Normalize language code (e.g., "hi-IN" -> "hi")
    final normalizedCode = languageCode.toLowerCase().split('-').first;

    const translations = {
      'en': 'Instructions for iOS',
      'hi': 'iOS के लिए निर्देश',
      'as': 'iOS ৰ বাবে নিৰ্দেশনা',
      'bn': 'iOS এর জন্য নির্দেশাবলী',
      'brx': 'iOS नि थाखाय बिजाब',
      'doi': 'iOS आस्तै निर्देश',
      'gu': 'iOS માટે સૂચનાઓ',
      'kn': 'iOS ಗಾಗಿ ಸೂಚನೆಗಳು',
      'kok': 'iOS खातीर सूचना',
      'ks': 'iOS باپَتھ ہِدایَتھ',
      'mai': 'iOS लेल निर्देश',
      'ml': 'iOS-നുള്ള നിർദ്ദേശങ്ങൾ',
      'mni': 'iOS গী অহান্বা',
      'mr': 'iOS साठी सूचना',
      'ne': 'iOS को लागि निर्देशन',
      'or': 'iOS ପାଇଁ ନିର୍ଦ୍ଦେଶ',
      'pa': 'iOS ਲਈ ਹਦਾਇਤਾਂ',
      'sa': 'iOS कृते निर्देशाः',
      'sat': 'iOS लागित बिजाब',
      'sd': 'iOS لاءِ هدايتون',
      'ta': 'iOS க்கான வழிமுறைகள்',
      'te': 'iOS కోసం సూచనలు',
      'ur': 'iOS کے لیے ہدایات',
    };
    return translations[normalizedCode] ?? 'Instructions for iOS';
  }

  static String getInstructionsForAndroid(String languageCode) {
    // Normalize language code (e.g., "hi-IN" -> "hi")
    final normalizedCode = languageCode.toLowerCase().split('-').first;

    const translations = {
      'en': 'Instructions for Android',
      'hi': 'Android के लिए निर्देश',
      'as': 'Android ৰ বাবে নিৰ্দেশনা',
      'bn': 'Android এর জন্য নির্দেশাবলী',
      'brx': 'Android नि थाखाय बिजाब',
      'doi': 'Android आस्तै निर्देश',
      'gu': 'Android માટે સૂચનાઓ',
      'kn': 'Android ಗಾಗಿ ಸೂಚನೆಗಳು',
      'kok': 'Android खातीर सूचना',
      'ks': 'Android باپَتھ ہِدایَتھ',
      'mai': 'Android लेल निर्देश',
      'ml': 'Android-നുള്ള നിർദ്ദേശങ്ങൾ',
      'mni': 'Android গী অহান্বা',
      'mr': 'Android साठी सूचना',
      'ne': 'Android को लागि निर्देशन',
      'or': 'Android ପାଇଁ ନିର୍ଦ୍ଦେଶ',
      'pa': 'Android ਲਈ ਹਦਾਇਤਾਂ',
      'sa': 'Android कृते निर्देशाः',
      'sat': 'Android लागित बिजाब',
      'sd': 'Android لاءِ هدايتون',
      'ta': 'Android க்கான வழிமுறைகள்',
      'te': 'Android కోసం సూచనలు',
      'ur': 'Android کے لیے ہدایات',
    };
    return translations[normalizedCode] ?? 'Instructions for Android';
  }

  // Get platform-specific instruction steps
  static List<String> getIOSInstructionSteps(String languageCode) {
    // Normalize language code (e.g., "hi-IN" -> "hi")
    final normalizedCode = languageCode.toLowerCase().split('-').first;

    final Map<String, List<String>> translations = {
      'en': [
        'Open Settings on your iOS device',
        'Go to Accessibility → Spoken Content (or search for "Spoken Content")',
        'Tap Voices',
        'Select the desired Language',
        'Choose a Voice and tap Download',
        'Wait for download (requires Wi-Fi)',
      ],
      'hi': [
        'अपने iOS डिवाइस पर सेटिंग्स खोलें',
        'Accessibility → Spoken Content पर जाएं',
        'Voices पर टैप करें',
        'अपनी भाषा चुनें',
        'एक आवाज़ चुनें और Download पर टैप करें',
        'डाउनलोड पूरा होने तक प्रतीक्षा करें (Wi-Fi आवश्यक)',
      ],
      'mr': [
        'तुमच्या iOS डिव्हाइसवर Settings उघडा',
        'Accessibility → Spoken Content वर जा',
        'Voices वर टॅप करा',
        'तुमची भाषा निवडा',
        'एक आवाज निवडा आणि Download वर टॅप करा',
        'डाउनलोड पूर्ण होईपर्यंत प्रतीक्षा करा (Wi-Fi आवश्यक)',
      ],
      'ta': [
        'உங்கள் iOS சாதனத்தில் Settings திறக்கவும்',
        'Accessibility → Spoken Content க்கு செல்லவும்',
        'Voices என்பதைத் தட்டவும்',
        'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்',
        'ஒரு குரலைத் தேர்ந்தெடுத்து Download தட்டவும்',
        'பதிவிறக்கம் முடியும் வரை காத்திருக்கவும் (Wi-Fi தேவை)',
      ],
      'te': [
        'మీ iOS పరికరంలో Settings తెరవండి',
        'Accessibility → Spoken Content కి వెళ్లండి',
        'Voices ను నొక్కండి',
        'మీ భాషను ఎంచుకోండి',
        'ఒక వాయిస్ ఎంచుకుని Download నొక్కండి',
        'డౌన్‌లోడ్ పూర్తయ్యే వరకు వేచి ఉండండి (Wi-Fi అవసరం)',
      ],
      'gu': [
        'તમારા iOS ઉપકરણ પર Settings ખોલો',
        'Accessibility → Spoken Content પર જાઓ',
        'Voices પર ટેપ કરો',
        'તમારી ભાષા પસંદ કરો',
        'એક અવાજ પસંદ કરો અને Download પર ટેપ કરો',
        'ડાઉનલોડ પૂર્ણ થાય ત્યાં સુધી રાહ જુઓ (Wi-Fi જરૂરી)',
      ],
      'kn': [
        'ನಿಮ್ಮ iOS ಸಾಧನದಲ್ಲಿ Settings ತೆರೆಯಿರಿ',
        'Accessibility → Spoken Content ಗೆ ಹೋಗಿ',
        'Voices ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ',
        'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
        'ಧ್ವನಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ ಮತ್ತು Download ಟ್ಯಾಪ್ ಮಾಡಿ',
        'ಡೌನ್‌ಲೋಡ್ ಪೂರ್ಣಗೊಳ್ಳುವವರೆಗೆ ನಿರೀಕ್ಷಿಸಿ (Wi-Fi ಅಗತ್ಯ)',
      ],
      'bn': [
        'আপনার iOS ডিভাইসে Settings খুলুন',
        'Accessibility → Spoken Content এ যান',
        'Voices ট্যাপ করুন',
        'আপনার ভাষা নির্বাচন করুন',
        'একটি ভয়েস নির্বাচন করুন এবং Download ট্যাপ করুন',
        'ডাউনলোড সম্পূর্ণ হওয়া পর্যন্ত অপেক্ষা করুন (Wi-Fi প্রয়োজন)',
      ],
      'ml': [
        'നിങ്ങളുടെ iOS ഉപകരണത്തിൽ Settings തുറക്കുക',
        'Accessibility → Spoken Content എന്നതിലേക്ക് പോകുക',
        'Voices ടാപ്പ് ചെയ്യുക',
        'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക',
        'ഒരു ശബ്ദം തിരഞ്ഞെടുത്ത് Download ടാപ്പ് ചെയ്യുക',
        'ഡൗൺലോഡ് പൂർത്തിയാകുന്നത് വരെ കാത്തിരിക്കുക (Wi-Fi ആവശ്യം)',
      ],
      'pa': [
        'ਆਪਣੇ iOS ਡਿਵਾਈਸ ਤੇ Settings ਖੋਲ੍ਹੋ',
        'Accessibility → Spoken Content ਤੇ ਜਾਓ',
        'Voices ਤੇ ਟੈਪ ਕਰੋ',
        'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ',
        'ਇੱਕ ਆਵਾਜ਼ ਚੁਣੋ ਅਤੇ Download ਤੇ ਟੈਪ ਕਰੋ',
        'ਡਾਊਨਲੋਡ ਪੂਰਾ ਹੋਣ ਤੱਕ ਉਡੀਕ ਕਰੋ (Wi-Fi ਲੋੜੀਂਦਾ)',
      ],
      'as': [
        'আপোনাৰ iOS ডিভাইচত Settings খোলক',
        'Accessibility → Spoken Content লৈ যাওক',
        'Voices টেপ কৰক',
        'আপোনাৰ ভাষা নিৰ্বাচন কৰক',
        'এটা কণ্ঠস্বৰ নিৰ্বাচন কৰক আৰু Download টেপ কৰক',
        'ডাউনলোড সম্পূৰ্ণ নোহোৱালৈকে অপেক্ষা কৰক (Wi-Fi প্ৰয়োজন)',
      ],
      'or': [
        'ଆପଣଙ୍କ iOS ଉପକରଣରେ Settings ଖୋଲନ୍ତୁ',
        'Accessibility → Spoken Content କୁ ଯାଆନ୍ତୁ',
        'Voices ଟ୍ୟାପ୍ କରନ୍ତୁ',
        'ଆପଣଙ୍କ ଭାଷା ଚୟନ କରନ୍ତୁ',
        'ଏକ ସ୍ୱର ଚୟନ କରନ୍ତୁ ଏବଂ Download ଟ୍ୟାପ୍ କରନ୍ତୁ',
        'ଡାଉନଲୋଡ୍ ସମ୍ପୂର୍ଣ୍ଣ ହେବା ପର୍ଯ୍ୟନ୍ତ ଅପେକ୍ଷା କରନ୍ତୁ (Wi-Fi ଆବଶ୍ୟକ)',
      ],
      'ur': [
        'اپنے iOS ڈیوائس پر Settings کھولیں',
        'Accessibility → Spoken Content پر جائیں',
        'Voices پر ٹیپ کریں',
        'اپنی زبان منتخب کریں',
        'ایک آواز منتخب کریں اور Download پر ٹیپ کریں',
        'ڈاؤن لوڈ مکمل ہونے تک انتظار کریں (Wi-Fi ضروری)',
      ],
    };

    return translations[normalizedCode] ?? translations['en']!;
  }

  static List<String> getAndroidInstructionSteps(String languageCode) {
    // Normalize language code (e.g., "hi-IN" -> "hi")
    final normalizedCode = languageCode.toLowerCase().split('-').first;

    final Map<String, List<String>> translations = {
      'en': [
        'Open phone Settings',
        'Go to System → Languages & input → Text-to-speech output',
        'Tap Google Text-to-speech Engine',
        'Tap the gear icon',
        'Select Install voice data (or Languages)',
        'Choose your language',
        'Tap Download (requires Wi-Fi; ~50-150 MB)',
        'Wait for download to complete',
      ],
      'hi': [
        'फोन की Settings खोलें',
        'System → Languages & input → Text-to-speech output पर जाएं',
        'Google Text-to-speech Engine पर टैप करें',
        'गियर आइकन पर टैप करें',
        'Install voice data (या Languages) चुनें',
        'अपनी भाषा चुनें',
        'Download पर टैप करें (Wi-Fi आवश्यक; ~50-150 MB)',
        'डाउनलोड पूरा होने तक प्रतीक्षा करें',
      ],
      'mr': [
        'फोनची Settings उघडा',
        'System → Languages & input → Text-to-speech output वर जा',
        'Google Text-to-speech Engine वर टॅप करा',
        'गियर आयकॉनवर टॅप करा',
        'Install voice data (किंवा Languages) निवडा',
        'तुमची भाषा निवडा',
        'Download वर टॅप करा (Wi-Fi आवश्यक; ~50-150 MB)',
        'डाउनलोड पूर्ण होईपर्यंत प्रतीक्षा करा',
      ],
      'ta': [
        'தொலைபேசி Settings திறக்கவும்',
        'System → Languages & input → Text-to-speech output க்கு செல்லவும்',
        'Google Text-to-speech Engine தட்டவும்',
        'கியர் ஐகானைத் தட்டவும்',
        'Install voice data (அல்லது Languages) தேர்ந்தெடுக்கவும்',
        'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்',
        'Download தட்டவும் (Wi-Fi தேவை; ~50-150 MB)',
        'பதிவிறக்கம் முடியும் வரை காத்திருக்கவும்',
      ],
      'te': [
        'ఫోన్ Settings తెరవండి',
        'System → Languages & input → Text-to-speech output కి వెళ్లండి',
        'Google Text-to-speech Engine ను నొక్కండి',
        'గేర్ చిహ్నాన్ని నొక్కండి',
        'Install voice data (లేదా Languages) ఎంచుకోండి',
        'మీ భాషను ఎంచుకోండి',
        'Download నొక్కండి (Wi-Fi అవసరం; ~50-150 MB)',
        'డౌన్‌లోడ్ పూర్తయ్యే వరకు వేచి ఉండండి',
      ],
      'gu': [
        'ફોનની Settings ખોલો',
        'System → Languages & input → Text-to-speech output પર જાઓ',
        'Google Text-to-speech Engine પર ટેપ કરો',
        'ગિયર આઇકોન પર ટેપ કરો',
        'Install voice data (અથવા Languages) પસંદ કરો',
        'તમારી ભાષા પસંદ કરો',
        'Download પર ટેપ કરો (Wi-Fi જરૂરી; ~50-150 MB)',
        'ડાઉનલોડ પૂર્ણ થાય ત્યાં સુધી રાહ જુઓ',
      ],
      'kn': [
        'ಫೋನ್ Settings ತೆರೆಯಿರಿ',
        'System → Languages & input → Text-to-speech output ಗೆ ಹೋಗಿ',
        'Google Text-to-speech Engine ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ',
        'ಗೇರ್ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ',
        'Install voice data (ಅಥವಾ Languages) ಆಯ್ಕೆಮಾಡಿ',
        'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
        'Download ಟ್ಯಾಪ್ ಮಾಡಿ (Wi-Fi ಅಗತ್ಯ; ~50-150 MB)',
        'ಡೌನ್‌ಲೋಡ್ ಪೂರ್ಣಗೊಳ್ಳುವವರೆಗೆ ನಿರೀಕ್ಷಿಸಿ',
      ],
      'bn': [
        'ফোনের Settings খুলুন',
        'System → Languages & input → Text-to-speech output এ যান',
        'Google Text-to-speech Engine ট্যাপ করুন',
        'গিয়ার আইকন ট্যাপ করুন',
        'Install voice data (বা Languages) নির্বাচন করুন',
        'আপনার ভাষা নির্বাচন করুন',
        'Download ট্যাপ করুন (Wi-Fi প্রয়োজন; ~50-150 MB)',
        'ডাউনলোড সম্পূর্ণ হওয়া পর্যন্ত অপেক্ষা করুন',
      ],
      'ml': [
        'ഫോണിന്റെ Settings തുറക്കുക',
        'System → Languages & input → Text-to-speech output എന്നതിലേക്ക് പോകുക',
        'Google Text-to-speech Engine ടാപ്പ് ചെയ്യുക',
        'ഗിയർ ഐക്കണിൽ ടാപ്പ് ചെയ്യുക',
        'Install voice data (അല്ലെങ്കിൽ Languages) തിരഞ്ഞെടുക്കുക',
        'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക',
        'Download ടാപ്പ് ചെയ്യുക (Wi-Fi ആവശ്യം; ~50-150 MB)',
        'ഡൗൺലോഡ് പൂർത്തിയാകുന്നത് വരെ കാത്തിരിക്കുക',
      ],
      'pa': [
        'ਫੋਨ ਦੀ Settings ਖੋਲ੍ਹੋ',
        'System → Languages & input → Text-to-speech output ਤੇ ਜਾਓ',
        'Google Text-to-speech Engine ਤੇ ਟੈਪ ਕਰੋ',
        'ਗੀਅਰ ਆਈਕਨ ਤੇ ਟੈਪ ਕਰੋ',
        'Install voice data (ਜਾਂ Languages) ਚੁਣੋ',
        'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ',
        'Download ਤੇ ਟੈਪ ਕਰੋ (Wi-Fi ਲੋੜੀਂਦਾ; ~50-150 MB)',
        'ਡਾਊਨਲੋਡ ਪੂਰਾ ਹੋਣ ਤੱਕ ਉਡੀਕ ਕਰੋ',
      ],
      'as': [
        'ফোনৰ Settings খোলক',
        'System → Languages & input → Text-to-speech output লৈ যাওক',
        'Google Text-to-speech Engine টেপ কৰক',
        'গিয়াৰ আইকন টেপ কৰক',
        'Install voice data (বা Languages) নিৰ্বাচন কৰক',
        'আপোনাৰ ভাষা নিৰ্বাচন কৰক',
        'Download টেপ কৰক (Wi-Fi প্ৰয়োজন; ~50-150 MB)',
        'ডাউনলোড সম্পূৰ্ণ নোহোৱালৈকে অপেক্ষা কৰক',
      ],
      'or': [
        'ଫୋନର Settings ଖୋଲନ୍ତୁ',
        'System → Languages & input → Text-to-speech output କୁ ଯାଆନ୍ତୁ',
        'Google Text-to-speech Engine ଟ୍ୟାପ୍ କରନ୍ତୁ',
        'ଗିୟର୍ ଆଇକନ୍ ଟ୍ୟାପ୍ କରନ୍ତୁ',
        'Install voice data (କିମ୍ବା Languages) ଚୟନ କରନ୍ତୁ',
        'ଆପଣଙ୍କ ଭାଷା ଚୟନ କରନ୍ତୁ',
        'Download ଟ୍ୟାପ୍ କରନ୍ତୁ (Wi-Fi ଆବଶ୍ୟକ; ~50-150 MB)',
        'ଡାଉନଲୋଡ୍ ସମ୍ପୂର୍ଣ୍ଣ ହେବା ପର୍ଯ୍ୟନ୍ତ ଅପେକ୍ଷା କରନ୍ତୁ',
      ],
      'ur': [
        'فون کی Settings کھولیں',
        'System → Languages & input → Text-to-speech output پر جائیں',
        'Google Text-to-speech Engine پر ٹیپ کریں',
        'گیئر آئیکن پر ٹیپ کریں',
        'Install voice data (یا Languages) منتخب کریں',
        'اپنی زبان منتخب کریں',
        'Download پر ٹیپ کریں (Wi-Fi ضروری; ~50-150 MB)',
        'ڈاؤن لوڈ مکمل ہونے تک انتظار کریں',
      ],
    };

    return translations[normalizedCode] ?? translations['en']!;
  }

  // Get continuation note text
  static String getContinueSurveyNote(String languageCode) {
    // Normalize language code (e.g., "hi-IN" -> "hi")
    final normalizedCode = languageCode.toLowerCase().split('-').first;

    const translations = {
      'en': 'You can continue with the survey. The voice features will work once you download the language pack.',
      'hi': 'आप सर्वेक्षण जारी रख सकते हैं। भाषा पैक डाउनलोड करने के बाद आवाज़ सुविधाएं काम करेंगी।',
      'as': 'আপুনি সৰ্বেক্ষণ চলাই থাকিব পাৰে। ভাষা পেক ডাউনলোড কৰাৰ পিছত কণ্ঠস্বৰ সুবিধা কাম কৰিব।',
      'bn': 'আপনি সার্ভে চালিয়ে যেতে পারেন। ভাষা প্যাক ডাউনলোড করলে ভয়েস বৈশিষ্ট্য কাজ করবে।',
      'brx': 'नों सार्भे जारि थानाय हाबफारगोन। भासा पेक डाउनलोड खालामनानि उनाव आवाज सुबिधा खामानि होगोन।',
      'doi': 'तुस सर्वे जारी रक्खी सकदे ओ। भाषा पैक डाउनलोड करने दे बाद आवाज़ सुविधाएं कम्म करगियां।',
      'gu': 'તમે સર્વેક્ષણ ચાલુ રાખી શકો છો. ભાષા પેક ડાઉનલોડ કર્યા પછી વૉઇસ સુવિધાઓ કામ કરશે.',
      'kn': 'ನೀವು ಸಮೀಕ್ಷೆಯನ್ನು ಮುಂದುವರಿಸಬಹುದು. ಭಾಷಾ ಪ್ಯಾಕ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ನಂತರ ಧ್ವನಿ ವೈಶಿಷ್ಟ್ಯಗಳು ಕೆಲಸ ಮಾಡುತ್ತವೆ.',
      'kok': 'तुमी सर्वेक्षण चालू दवरूं शकता. भास पॅक डाउनलोड केल्या उपरांत आवाज सुविधा काम करतली.',
      'ks': 'تہٕ سَروے جٲری تھٲوِتھ ہیکیو۔ زَبان پیک ڈاونلوڈ کَرنہٕ پَتہٕ آواز خصوصیات کٲم کَرِن۔',
      'mai': 'अहाँ सर्वेक्षण जारी राखि सकै छी। भाषा पैक डाउनलोड करबाक बाद आवाज सुविधा काज करत।',
      'ml': 'നിങ്ങൾക്ക് സർവേ തുടരാം. ഭാഷാ പാക്ക് ഡൗൺലോഡ് ചെയ്‌താൽ വോയ്‌സ് ഫീച്ചറുകൾ പ്രവർത്തിക്കും.',
      'mni': 'নহাক্না সার্ভেদু শান্দোকহনবা যায়। লোন্না পেক তৌখ্রবা মতুংদা অবানা ফীভমশীং তাউবা হৌরক্কনি।',
      'mr': 'तुम्ही सर्वेक्षण सुरू ठेवू शकता. भाषा पॅक डाउनलोड केल्यावर आवाज वैशिष्ट्ये कार्य करतील.',
      'ne': 'तपाईं सर्वे जारी राख्न सक्नुहुन्छ। भाषा प्याक डाउनलोड गरेपछि आवाज सुविधा काम गर्नेछ।',
      'or': 'ଆପଣ ସର୍ବେ ଜାରି ରଖିପାରିବେ। ଭାଷା ପ୍ୟାକ୍ ଡାଉନଲୋଡ୍ କଲା ପରେ ଭଏସ୍ ବୈଶିଷ୍ଟ୍ୟ କାମ କରିବ।',
      'pa': 'ਤੁਸੀਂ ਸਰਵੇਖਣ ਜਾਰੀ ਰੱਖ ਸਕਦੇ ਹੋ। ਭਾਸ਼ਾ ਪੈਕ ਡਾਊਨਲੋਡ ਕਰਨ ਤੋਂ ਬਾਅਦ ਆਵਾਜ਼ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਕੰਮ ਕਰਨਗੀਆਂ।',
      'sa': 'भवन्तः सर्वेक्षणं निरन्तरं कर्तुं शक्नुवन्ति। भाषा-पैकं डाउनलोडं कृत्वा ध्वनि-विशेषताः कार्यं करिष्यन्ति।',
      'sat': 'आप सार्वे जारि दाड़ेयाक हो। भासा पैक डाउनलोड आकाना उनाव आवाज सुविधा काम लागत बा।',
      'sd': 'توهان سروي جاري رکي سگھو ٿا. ٻولي پيڪ ڊائون لوڊ ڪرڻ کانپوءِ آواز جون خاصيتون ڪم ڪنديون.',
      'ta': 'நீங்கள் கருத்துக்கணிப்பைத் தொடரலாம். மொழித் தொகுப்பைப் பதிவிறக்கியதும் குரல் அம்சங்கள் செயல்படும்.',
      'te': 'మీరు సర్వేను కొనసాగించవచ్চు. భాష ప్యాక్‌ని డౌన్‌లోడ్ చేసిన తర్వాత వాయిస్ ఫీచర్లు పని చేస్తాయి.',
      'ur': 'آپ سروے جاری رکھ سکتے ہیں۔ زبان پیک ڈاؤن لوڈ کرنے کے بعد آواز کی خصوصیات کام کریں گی۔',
    };
    return translations[normalizedCode] ?? 'You can continue with the survey. The voice features will work once you download the language pack.';
  }

  // ===== SIGNATURE-RELATED TRANSLATIONS =====
  // AI-generated translations - verify with native speakers

  /// Translation for "Upload Signature"
  static String getUploadSignature(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Upload Signature',
      'hi': 'हस्ताक्षर अपलोड करें',
      'as': 'স্বাক্ষৰ আপলোড কৰক',
      'bn': 'স্বাক্ষর আপলোড করুন',
      'brx': 'हस्ताखोर अपलोड खालाम',
      'doi': 'दस्तखत अपलोड करो',
      'gu': 'સહી અપલોડ કરો',
      'kn': 'ಸಹಿ ಅಪ್‌ಲೋಡ್ ಮಾಡಿ',
      'kok': 'सही अपलोड करा',
      'ks': 'دَستخَط اَپلوڈ کَریو',
      'mai': 'हस्ताक्षर अपलोड करू',
      'ml': 'ഒപ്പ് അപ്‌ലോഡ് ചെയ്യുക',
      'mni': 'সাইন অপলোদ তৌবীয়ু',
      'mr': 'स्वाक्षरी अपलोड करा',
      'ne': 'हस्ताक्षर अपलोड गर्नुहोस्',
      'or': 'ଦସ୍ତଖତ ଅପଲୋଡ୍ କରନ୍ତୁ',
      'pa': 'ਦਸਤਖ਼ਤ ਅੱਪਲੋਡ ਕਰੋ',
      'sa': 'हस्ताक्षरं आरोपयतु',
      'sat': 'दसखोत अपलोड मे',
      'sd': 'دستخط اپلوڊ ڪريو',
      'ta': 'கையொப்பத்தைப் பதிவேற்றவும்',
      'te': 'సంతకాన్ని అప్‌లోడ్ చేయండి',
      'ur': 'دستخط اپ لوڈ کریں',
    };
    return translations[normalizedCode] ?? 'Upload Signature';
  }

  /// Translation for "Draw Signature"
  static String getDrawSignature(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Draw Signature',
      'hi': 'हस्ताक्षर बनाएं',
      'as': 'স্বাক্ষৰ আঁকক',
      'bn': 'স্বাক্ষর আঁকুন',
      'brx': 'हस्ताखोर सोरजि',
      'doi': 'दस्तखत बणाओ',
      'gu': 'સહી દોરો',
      'kn': 'ಸಹಿ ಬರೆಯಿರಿ',
      'kok': 'सही काडा',
      'ks': 'دَستخَط کَریو',
      'mai': 'हस्ताक्षर बनाउ',
      'ml': 'ഒപ്പ് വരയ്ക്കുക',
      'mni': 'সাইন শেম্বা',
      'mr': 'स्वाक्षरी काढा',
      'ne': 'हस्ताक्षर कोर्नुहोस्',
      'or': 'ଦସ୍ତଖତ ଅଙ୍କନ କରନ୍ତୁ',
      'pa': 'ਦਸਤਖ਼ਤ ਬਣਾਓ',
      'sa': 'हस्ताक्षरं रचयतु',
      'sat': 'दसखोत तेयार मे',
      'sd': 'دستخط ٺاھيو',
      'ta': 'கையொப்பத்தை வரையவும்',
      'te': 'సంతకాన్ని గీయండి',
      'ur': 'دستخط بنائیں',
    };
    return translations[normalizedCode] ?? 'Draw Signature';
  }

  /// Translation for "Clear"
  static String getClearText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Clear',
      'hi': 'साफ़ करें',
      'as': 'মচি পেলাওক',
      'bn': 'মুছুন',
      'brx': 'खोमान',
      'doi': 'साफ़ करो',
      'gu': 'સાફ કરો',
      'kn': 'ತೆರವುಗೊಳಿಸಿ',
      'kok': 'साफ करा',
      'ks': 'صاف کَریو',
      'mai': 'साफ़ करू',
      'ml': 'മായ്ക്കുക',
      'mni': 'থিংদোক-ই',
      'mr': 'साफ करा',
      'ne': 'खाली गर्नुहोस्',
      'or': 'ସଫା କରନ୍ତୁ',
      'pa': 'ਸਾਫ਼ ਕਰੋ',
      'sa': 'स्वच्छं कुरुतु',
      'sat': 'साफ मे',
      'sd': 'صاف ڪريو',
      'ta': 'அழிக்கவும்',
      'te': 'క్లియర్ చేయండి',
      'ur': 'صاف کریں',
    };
    return translations[normalizedCode] ?? 'Clear';
  }

  /// Translation for "Save"
  static String getSaveText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Save',
      'hi': 'सहेजें',
      'as': 'সংৰক্ষণ কৰক',
      'bn': 'সংরক্ষণ করুন',
      'brx': 'थि',
      'doi': 'सहेजो',
      'gu': 'સાચવો',
      'kn': 'ಉಳಿಸಿ',
      'kok': 'जतन करा',
      'ks': 'محفوظ کَریو',
      'mai': 'सुरक्षित करू',
      'ml': 'സംരക്ഷിക്കുക',
      'mni': 'থম্বা',
      'mr': 'जतन करा',
      'ne': 'सेभ गर्नुहोस्',
      'or': 'ସଂରକ୍ଷଣ କରନ୍ତୁ',
      'pa': 'ਸੁਰੱਖਿਅਤ ਕਰੋ',
      'sa': 'संरक्षयतु',
      'sat': 'बांचाव मे',
      'sd': 'محفوظ ڪريو',
      'ta': 'சேமிக்கவும்',
      'te': 'సేవ్ చేయండి',
      'ur': 'محفوظ کریں',
    };
    return translations[normalizedCode] ?? 'Save';
  }

  /// Translation for "Signature"
  static String getSignatureText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Signature',
      'hi': 'हस्ताक्षर',
      'as': 'স্বাক্ষৰ',
      'bn': 'স্বাক্ষর',
      'brx': 'हस्ताखोर',
      'doi': 'दस्तखत',
      'gu': 'સહી',
      'kn': 'ಸಹಿ',
      'kok': 'सही',
      'ks': 'دَستخَط',
      'mai': 'हस्ताक्षर',
      'ml': 'ഒപ്പ്',
      'mni': 'সাইন',
      'mr': 'स्वाक्षरी',
      'ne': 'हस्ताक्षर',
      'or': 'ଦସ୍ତଖତ',
      'pa': 'ਦਸਤਖ਼ਤ',
      'sa': 'हस्ताक्षरम्',
      'sat': 'दसखोत',
      'sd': 'دستخط',
      'ta': 'கையொப்பம்',
      'te': 'సంతకం',
      'ur': 'دستخط',
    };
    return translations[normalizedCode] ?? 'Signature';
  }

  /// Translation for "Please draw a signature"
  static String getPleaseDrawSignature(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Please draw a signature',
      'hi': 'कृपया हस्ताक्षर बनाएं',
      'as': 'অনুগ্ৰহ কৰি স্বাক্ষৰ আঁকক',
      'bn': 'অনুগ্রহ করে স্বাক্ষর আঁকুন',
      'brx': 'अबुं हस्ताखोर सोरजि',
      'doi': 'कृपा करियै दस्तखत बणाओ',
      'gu': 'કૃપા કરીને સહી દોરો',
      'kn': 'ದಯವಿಟ್ಟು ಸಹಿ ಬರೆಯಿರಿ',
      'kok': 'कृपया सही काडा',
      'ks': 'مہربأنی کٔرتھ دَستخَط کَریو',
      'mai': 'कृपया हस्ताक्षर बनाउ',
      'ml': 'ദയവായി ഒപ്പ് വരയ്ക്കുക',
      'mni': 'চানবিদুনা সাইন শেম্বীয়ু',
      'mr': 'कृपया स्वाक्षरी काढा',
      'ne': 'कृपया हस्ताक्षर कोर्नुहोस्',
      'or': 'ଦୟାକରି ଦସ୍ତଖତ ଅଙ୍କନ କରନ୍ତୁ',
      'pa': 'ਕਿਰਪਾ ਕਰਕੇ ਦਸਤਖ਼ਤ ਬਣਾਓ',
      'sa': 'कृपया हस्ताक्षरं रचयतु',
      'sat': 'दोया केत दसखोत तेयार मे',
      'sd': 'مھرباني ڪري دستخط ٺاھيو',
      'ta': 'தயவுசெய்து கையொப்பத்தை வரையவும்',
      'te': 'దయచేసి సంతకాన్ని గీయండి',
      'ur': 'براہ کرم دستخط بنائیں',
    };
    return translations[normalizedCode] ?? 'Please draw a signature';
  }

  /// Translation for "Tap to draw signature"
  static String getTapToDrawSignature(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Tap to draw signature',
      'hi': 'हस्ताक्षर करने के लिए टैप करें',
      'as': 'স্বাক্ষৰ আঁকিবলৈ টেপ কৰক',
      'bn': 'স্বাক্ষর আঁকতে ট্যাপ করুন',
      'brx': 'हस्ताखोर सोरजिनो टेप खालाम',
      'doi': 'दस्तखत बणाने आस्तै टैप करो',
      'gu': 'સહી દોરવા માટે ટેપ કરો',
      'kn': 'ಸಹಿ ಬರೆಯಲು ಟ್ಯಾಪ್ ಮಾಡಿ',
      'kok': 'सही काडपाक टॅप करा',
      'ks': 'دَستخَط کَرنہٕ باپَتھ ٹیپ کَریو',
      'mai': 'हस्ताक्षर बनाबै लेल टैप करू',
      'ml': 'ഒപ്പ് വരയ്ക്കാൻ ടാപ്പ് ചെയ്യുക',
      'mni': 'সাইন শেম্বনবা টেপ তৌবীয়ু',
      'mr': 'स्वाक्षरी काढण्यासाठी टॅप करा',
      'ne': 'हस्ताक्षर कोर्न ट्याप गर्नुहोस्',
      'or': 'ଦସ୍ତଖତ ଅଙ୍କନ କରିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ',
      'pa': 'ਦਸਤਖ਼ਤ ਬਣਾਉਣ ਲਈ ਟੈਪ ਕਰੋ',
      'sa': 'हस्ताक्षरं रचयितुं स्पृशतु',
      'sat': 'दसखोत तेयार लेका टेप मे',
      'sd': 'دستخط ٺاھڻ لاءِ ٽيپ ڪريو',
      'ta': 'கையொப்பத்தை வரைய தட்டவும்',
      'te': 'సంతకాన్ని గీయడానికి ట్యాప్ చేయండి',
      'ur': 'دستخط بنانے کے لیے ٹیپ کریں',
    };
    return translations[normalizedCode] ?? 'Tap to draw signature';
  }

  /// Translation for "Uploading..."
  static String getUploadingText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Uploading...',
      'hi': 'अपलोड हो रहा है...',
      'as': 'আপলোড হৈ আছে...',
      'bn': 'আপলোড হচ্ছে...',
      'brx': 'अपलोड होनाय दं...',
      'doi': 'अपलोड होआ ऐ...',
      'gu': 'અપલોડ થઈ રહ્યું છે...',
      'kn': 'ಅಪ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ...',
      'kok': 'अपलोड जातां...',
      'ks': 'اَپلوڈ گَژھان چھُ...',
      'mai': 'अपलोड भ रहल अछि...',
      'ml': 'അപ്‌ലോഡ് ചെയ്യുന്നു...',
      'mni': 'অপলোদ তৌরি...',
      'mr': 'अपलोड होत आहे...',
      'ne': 'अपलोड गर्दै...',
      'or': 'ଅପଲୋଡ୍ ହେଉଛି...',
      'pa': 'ਅੱਪਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...',
      'sa': 'आरोपणं भवति...',
      'sat': 'अपलोड होवा रे...',
      'sd': 'اپلوڊ ٿي رھيو آھي...',
      'ta': 'பதிவேற்றுகிறது...',
      'te': 'అప్‌లోడ్ చేస్తోంది...',
      'ur': 'اپ لوڈ ہو رہا ہے...',
    };
    return translations[normalizedCode] ?? 'Uploading...';
  }

  // ===== PHOTO-RELATED TRANSLATIONS =====
  // AI-generated translations - verify with native speakers

  /// Translation for "Photo"
  static String getPhotoText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Photo',
      'hi': 'फोटो',
      'as': 'ফটো',
      'bn': 'ফটো',
      'brx': 'फोटो',
      'doi': 'फोटो',
      'gu': 'ફોટો',
      'kn': 'ಫೋಟೋ',
      'kok': 'फोटो',
      'ks': 'فوٹو',
      'mai': 'फोटो',
      'ml': 'ഫോട്ടോ',
      'mni': 'ফোতো',
      'mr': 'फोटो',
      'ne': 'फोटो',
      'or': 'ଫଟୋ',
      'pa': 'ਫੋਟੋ',
      'sa': 'चित्रम्',
      'sat': 'फोटो',
      'sd': 'فوٽو',
      'ta': 'புகைப்படம்',
      'te': 'ఫోటో',
      'ur': 'تصویر',
    };
    return translations[normalizedCode] ?? 'Photo';
  }

  /// Translation for "Upload Photo"
  static String getUploadPhoto(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Upload Photo',
      'hi': 'फोटो अपलोड करें',
      'as': 'ফটো আপলোড কৰক',
      'bn': 'ফটো আপলোড করুন',
      'brx': 'फोटो अपलोड खालाम',
      'doi': 'फोटो अपलोड करो',
      'gu': 'ફોટો અપલોડ કરો',
      'kn': 'ಫೋಟೋ ಅಪ್‌ಲೋಡ್ ಮಾಡಿ',
      'kok': 'फोटो अपलोड करा',
      'ks': 'فوٹو اَپلوڈ کَریو',
      'mai': 'फोटो अपलोड करू',
      'ml': 'ഫോട്ടോ അപ്‌ലോഡ് ചെയ്യുക',
      'mni': 'ফোতো অপলোদ তৌবীয়ু',
      'mr': 'फोटो अपलोड करा',
      'ne': 'फोटो अपलोड गर्नुहोस्',
      'or': 'ଫଟୋ ଅପଲୋଡ୍ କରନ୍ତୁ',
      'pa': 'ਫੋਟੋ ਅੱਪਲੋਡ ਕਰੋ',
      'sa': 'चित्रं आरोपयतु',
      'sat': 'फोटो अपलोड मे',
      'sd': 'فوٽو اپلوڊ ڪريو',
      'ta': 'புகைப்படத்தைப் பதிவேற்றவும்',
      'te': 'ఫోటోను అప్‌లోడ్ చేయండి',
      'ur': 'تصویر اپ لوڈ کریں',
    };
    return translations[normalizedCode] ?? 'Upload Photo';
  }

  /// Translation for "Photo skipped"
  static String getPhotoSkipped(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Photo skipped',
      'hi': 'फोटो छोड़ा गया',
      'as': 'ফটো এৰি দিয়া হ\'ল',
      'bn': 'ফটো এড়িয়ে যাওয়া হয়েছে',
      'brx': 'फोटो सोद होदों',
      'doi': 'फोटो छड्डेआ गेआ',
      'gu': 'ફોટો છોડી દીધો',
      'kn': 'ಫೋಟೋ ಬಿಟ್ಟುಬಿಟ್ಟದೆ',
      'kok': 'फोटो सोडून दिलो',
      'ks': 'فوٹو سَتھ وۄتمُت',
      'mai': 'फोटो छोड़ि देल गेल',
      'ml': 'ഫോട്ടോ ഒഴിവാക്കി',
      'mni': 'ফোতো শেংদোক্লে',
      'mr': 'फोटो वगळला',
      'ne': 'फोटो छोडियो',
      'or': 'ଫଟୋ ଛାଡ଼ି ଦିଆଗଲା',
      'pa': 'ਫੋਟੋ ਛੱਡ ਦਿੱਤੀ',
      'sa': 'चित्रं त्यक्तम्',
      'sat': 'फोटो छाडल बा',
      'sd': 'فوٽو ڇڏي ڏنو',
      'ta': 'புகைப்படம் தவிர்க்கப்பட்டது',
      'te': 'ఫోటో దాటవేయబడింది',
      'ur': 'تصویر چھوڑ دی گئی',
    };
    return translations[normalizedCode] ?? 'Photo skipped';
  }

  /// Translation for "Tap to add photo"
  static String getTapToAddPhoto(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Tap to add photo',
      'hi': 'फोटो जोड़ने के लिए टैप करें',
      'as': 'ফটো যোগ কৰিবলৈ টেপ কৰক',
      'bn': 'ফটো যোগ করতে ট্যাপ করুন',
      'brx': 'फोटो दाजाबनो टेप खालाम',
      'doi': 'फोटो जोड़ने आस्तै टैप करो',
      'gu': 'ફોટો ઉમેરવા માટે ટેપ કરો',
      'kn': 'ಫೋಟೋ ಸೇರಿಸಲು ಟ್ಯಾಪ್ ಮಾಡಿ',
      'kok': 'फोटो घालपाक टॅप करा',
      'ks': 'فوٹو جَمع کَرنہٕ باپَتھ ٹیپ کَریو',
      'mai': 'फोटो जोड़बै लेल टैप करू',
      'ml': 'ഫോട്ടോ ചേർക്കാൻ ടാപ്പ് ചെയ്യുക',
      'mni': 'ফোতো হাপচিন্নবা টেপ তৌবীয়ু',
      'mr': 'फोटो जोडण्यासाठी टॅप करा',
      'ne': 'फोटो थप्न ट्याप गर्नुहोस्',
      'or': 'ଫଟୋ ଯୋଡିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ',
      'pa': 'ਫੋਟੋ ਜੋੜਨ ਲਈ ਟੈਪ ਕਰੋ',
      'sa': 'चित्रं योजयितुं स्पृशतु',
      'sat': 'फोटो जोड लेका टेप मे',
      'sd': 'فوٽو شامل ڪرڻ لاءِ ٽيپ ڪريو',
      'ta': 'புகைப்படத்தைச் சேர்க்க தட்டவும்',
      'te': 'ఫోటోను జోడించడానికి ట్యాప్ చేయండి',
      'ur': 'تصویر شامل کرنے کے لیے ٹیپ کریں',
    };
    return translations[normalizedCode] ?? 'Tap to add photo';
  }

  /// Translation for "Skip"
  static String getSkipText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Skip',
      'hi': 'छोड़ें',
      'as': 'এৰক',
      'bn': 'এড়িয়ে যান',
      'brx': 'सोद',
      'doi': 'छड्डो',
      'gu': 'છોડો',
      'kn': 'ಬಿಟ್ಟುಬಿಡಿ',
      'kok': 'सोडा',
      'ks': 'سَتھ وۄتمُت',
      'mai': 'छोड़ू',
      'ml': 'ഒഴിവാക്കുക',
      'mni': 'শেংদোক-উ',
      'mr': 'वगळा',
      'ne': 'छोड्नुहोस्',
      'or': 'ଛାଡନ୍ତୁ',
      'pa': 'ਛੱਡੋ',
      'sa': 'त्यजतु',
      'sat': 'छाड मे',
      'sd': 'ڇڏي ڏيو',
      'ta': 'தவிர்க்கவும்',
      'te': 'దాటవేయండి',
      'ur': 'چھوڑیں',
    };
    return translations[normalizedCode] ?? 'Skip';
  }

  // ===== DIALOG/ALERT TRANSLATIONS =====
  // AI-generated translations - verify with native speakers

  /// Translation for "Warning"
  static String getWarningText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Warning',
      'hi': 'चेतावनी',
      'as': 'সকীয়নি',
      'bn': 'সতর্কতা',
      'brx': 'गोहोमथि',
      'doi': 'चेतावनी',
      'gu': 'ચેતવણી',
      'kn': 'ಎಚ್ಚರಿಕೆ',
      'kok': 'धोकेबाजी',
      'ks': 'خبردأری',
      'mai': 'चेतावनी',
      'ml': 'മുന്നറിയിപ്പ്',
      'mni': 'নিংশিংবা',
      'mr': 'इशारा',
      'ne': 'चेतावनी',
      'or': 'ଚେତାବନୀ',
      'pa': 'ਚੇਤਾਵਨੀ',
      'sa': 'चेतावनी',
      'sat': 'चेतावनी',
      'sd': 'ڊيڄاريندڙ',
      'ta': 'எச்சரிக்கை',
      'te': 'హెచ్చరిక',
      'ur': 'انتباہ',
    };
    return translations[normalizedCode] ?? 'Warning';
  }

  /// Translation for "OK"
  static String getOKText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'OK',
      'hi': 'ठीक है',
      'as': 'ঠিক আছে',
      'bn': 'ঠিক আছে',
      'brx': 'होगोन',
      'doi': 'ठीक ऐ',
      'gu': 'બરાબર',
      'kn': 'ಸರಿ',
      'kok': 'बरें',
      'ks': 'ٹھیک چھُ',
      'mai': 'ठीक छै',
      'ml': 'ശരി',
      'mni': 'হোই',
      'mr': 'ठीक आहे',
      'ne': 'ठीक छ',
      'or': 'ଠିକ୍ ଅଛି',
      'pa': 'ਠੀਕ ਹੈ',
      'sa': 'उचितम्',
      'sat': 'ठीक बा',
      'sd': 'ٺيڪ آھي',
      'ta': 'சரி',
      'te': 'సరే',
      'ur': 'ٹھیک ہے',
    };
    return translations[normalizedCode] ?? 'OK';
  }

  /// Translation for "This field is required"
  static String getFieldRequiredText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'This field is required',
      'hi': 'यह फ़ील्ड आवश्यक है',
      'as': 'এই ফিল্ড প্ৰয়োজনীয়',
      'bn': 'এই ক্ষেত্রটি প্রয়োজনীয়',
      'brx': 'बे फिल्ड गोनांथि',
      'doi': 'एह फील्ड जरूरी ऐ',
      'gu': 'આ ફીલ્ડ જરૂરી છે',
      'kn': 'ಈ ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'kok': 'हे फिल्ड गरजेचे आसा',
      'ks': 'یہِ فیلڑ ضروری چھُ',
      'mai': 'ई फील्ड जरूरी अछि',
      'ml': 'ഈ ഫീൽഡ് ആവശ്യമാണ്',
      'mni': 'মসিগী ফীল্দ মথৌ তায়',
      'mr': 'हे फील्ड आवश्यक आहे',
      'ne': 'यो क्षेत्र आवश्यक छ',
      'or': 'ଏହି କ୍ଷେତ୍ର ଆବଶ୍ୟକ',
      'pa': 'ਇਹ ਫੀਲਡ ਲੋੜੀਂਦਾ ਹੈ',
      'sa': 'एतत् क्षेत्रं आवश्यकम्',
      'sat': 'ए फिल्ड जरुरी बा',
      'sd': 'هي فيلڊ ضروري آهي',
      'ta': 'இந்த புலம் தேவை',
      'te': 'ఈ ఫీల్డ్ అవసరం',
      'ur': 'یہ فیلڈ ضروری ہے',
    };
    return translations[normalizedCode] ?? 'This field is required';
  }

  /// Translation for "Try Again"
  static String getTryAgainText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Try Again',
      'hi': 'पुनः प्रयास करें',
      'as': 'পুনৰ চেষ্টা কৰক',
      'bn': 'আবার চেষ্টা করুন',
      'brx': 'उननै होदों खालाम',
      'doi': 'फिरी कोशिश करो',
      'gu': 'ફરી પ્રયાસ કરો',
      'kn': 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ',
      'kok': 'परत यत्न करा',
      'ks': 'وَری کوشِش کَریو',
      'mai': 'फिनु कोशिश करू',
      'ml': 'വീണ്ടും ശ്രമിക്കുക',
      'mni': 'অমুক হোত্নবা',
      'mr': 'पुन्हा प्रयत्न करा',
      'ne': 'फेरि प्रयास गर्नुहोस्',
      'or': 'ପୁନର୍ବାର ଚେଷ୍ଟା କରନ୍ତୁ',
      'pa': 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ',
      'sa': 'पुनः प्रयत्नं कुरुतु',
      'sat': 'दुबार कोसिस मे',
      'sd': 'ٻيهر ڪوشش ڪريو',
      'ta': 'மீண்டும் முயற்சிக்கவும்',
      'te': 'మళ్లీ ప్రయత్నించండి',
      'ur': 'دوبارہ کوشش کریں',
    };
    return translations[normalizedCode] ?? 'Try Again';
  }

  // ===== SURVEY INTERACTION TRANSLATIONS =====
  // AI-generated translations - verify with native speakers

  /// Translation for "Your options are"
  static String getYourOptionsAreText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Your options are',
      'hi': 'आपके विकल्प हैं',
      'as': 'আপোনাৰ বিকল্পসমূহ হ\'ল',
      'bn': 'আপনার বিকল্পগুলি হল',
      'brx': 'नोंथांनि बिखायथार होगोन',
      'doi': 'तुंदे विकल्प न',
      'gu': 'તમારા વિકલ્પો છે',
      'kn': 'ನಿಮ್ಮ ಆಯ್ಕೆಗಳು',
      'kok': 'तुमचे पर्याय आसात',
      'ks': 'تُہنٛدؠ اِختیار چھِ',
      'mai': 'अहांक विकल्प छै',
      'ml': 'നിങ്ങളുടെ ഓപ്ഷനുകൾ',
      'mni': 'নহাক্কী চয়ন্সশীং অসি',
      'mr': 'तुमचे पर्याय आहेत',
      'ne': 'तपाईंका विकल्पहरू छन्',
      'or': 'ଆପଣଙ୍କର ବିକଳ୍ପଗୁଡ଼ିକ',
      'pa': 'ਤੁਹਾਡੇ ਵਿਕਲਪ ਹਨ',
      'sa': 'भवतः विकल्पाः सन्ति',
      'sat': 'आपनाक बिकल्प बा',
      'sd': 'توھان جا اختيار آھن',
      'ta': 'உங்கள் விருப்பங்கள்',
      'te': 'మీ ఎంపికలు',
      'ur': 'آپ کے اختیارات ہیں',
    };
    return translations[normalizedCode] ?? 'Your options are';
  }

  // Note: "Option" translation already exists as getOptionText() at line 758

  /// Translation for "Or type below"
  static String getOrTypeBelow(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Or type below',
      'hi': 'या नीचे टाइप करें',
      'as': 'নাইবা তলত টাইপ কৰক',
      'bn': 'অথবা নিচে টাইপ করুন',
      'brx': 'नायदा गाहायाव टाइप खालाम',
      'doi': 'जां थल्लै टाइप करो',
      'gu': 'અથવા નીચે ટાઇપ કરો',
      'kn': 'ಅಥವಾ ಕೆಳಗೆ ಟೈಪ್ ಮಾಡಿ',
      'kok': 'वा सकयल टाइप करा',
      'ks': 'یا تَلہِ ٹایِپ کَریو',
      'mai': 'या नीचां टाइप करू',
      'ml': 'അല്ലെങ്കിൽ താഴെ ടൈപ്പ് ചെയ്യുക',
      'mni': 'নত্রগা মখাদা তায়বীয়ু',
      'mr': 'किंवा खाली टाइप करा',
      'ne': 'वा तल टाइप गर्नुहोस्',
      'or': 'କିମ୍ବା ତଳେ ଟାଇପ୍ କରନ୍ତୁ',
      'pa': 'ਜਾਂ ਹੇਠਾਂ ਟਾਈਪ ਕਰੋ',
      'sa': 'अथवा अधः टङ्कयतु',
      'sat': 'या नीचे टाइप मे',
      'sd': 'يا هيٺ ٽائيپ ڪريو',
      'ta': 'அல்லது கீழே தட்டச்சு செய்யவும்',
      'te': 'లేదా క్రింద టైప్ చేయండి',
      'ur': 'یا نیچے ٹائپ کریں',
    };
    return translations[normalizedCode] ?? 'Or type below';
  }

  /// Translation for "Type here..."
  static String getTypeHere(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Type here...',
      'hi': 'यहाँ टाइप करें...',
      'as': 'ইয়াত টাইপ কৰক...',
      'bn': 'এখানে টাইপ করুন...',
      'brx': 'मानां टाइप खालाम...',
      'doi': 'इत्थै टाइप करो...',
      'gu': 'અહીં ટાઇપ કરો...',
      'kn': 'ಇಲ್ಲಿ ಟೈಪ್ ಮಾಡಿ...',
      'kok': 'हांगा टाइप करा...',
      'ks': 'أتھ ٹایِپ کَریو...',
      'mai': 'एतै टाइप करू...',
      'ml': 'ഇവിടെ ടൈപ്പ് ചെയ്യുക...',
      'mni': 'মপাংদা তায়বীয়ু...',
      'mr': 'येथे टाइप करा...',
      'ne': 'यहाँ टाइप गर्नुहोस्...',
      'or': 'ଏଠାରେ ଟାଇପ୍ କରନ୍ତୁ...',
      'pa': 'ਇੱਥੇ ਟਾਈਪ ਕਰੋ...',
      'sa': 'अत्र टङ्कयतु...',
      'sat': 'एते टाइप मे...',
      'sd': 'هتي ٽائيپ ڪريو...',
      'ta': 'இங்கே தட்டச்சு செய்யவும்...',
      'te': 'ఇక్కడ టైప్ చేయండి...',
      'ur': 'یہاں ٹائپ کریں...',
    };
    return translations[normalizedCode] ?? 'Type here...';
  }

  /// Translation for "No options available"
  static String getNoOptionsAvailable(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'No options available',
      'hi': 'कोई विकल्प उपलब्ध नहीं',
      'as': 'কোনো বিকল্প উপলব্ধ নাই',
      'bn': 'কোনো বিকল্প উপলব্ধ নেই',
      'brx': 'रावबो बिखायथार दं',
      'doi': 'कोई विकल्प उपलब्ध नेईं',
      'gu': 'કોઈ વિકલ્પ ઉપલબ્ધ નથી',
      'kn': 'ಯಾವ ಆಯ್ಕೆಗಳೂ ಲಭ್ಯವಿಲ್ಲ',
      'kok': 'कसलोच पर्याय ना',
      'ks': 'کانٛہہ اِختیار دَستِیاب چھُ نہٕ',
      'mai': 'कोनो विकल्प उपलब्ध नहि',
      'ml': 'ഓപ്ഷനുകളൊന്നും ലഭ്യമല്ല',
      'mni': 'চয়ন্স অমত্তা লৈতে',
      'mr': 'कोणताही पर्याय उपलब्ध नाही',
      'ne': 'कुनै विकल्प उपलब्ध छैन',
      'or': 'କୌଣସି ବିକଳ୍ପ ଉପଲବ୍ଧ ନାହିଁ',
      'pa': 'ਕੋਈ ਵਿਕਲਪ ਉਪਲਬਧ ਨਹੀਂ',
      'sa': 'न कोऽपि विकल्पः उपलब्धः',
      'sat': 'कोनो बिकल्प उपलब्ध नांय बा',
      'sd': 'ڪوبہ اختيار موجود ناهي',
      'ta': 'விருப்பங்கள் எதுவும் இல்லை',
      'te': 'ఎంపికలు అందుబాటులో లేవు',
      'ur': 'کوئی اختیار دستیاب نہیں',
    };
    return translations[normalizedCode] ?? 'No options available';
  }

  /// Translation for "Select an option..."
  static String getSelectOption(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Select an option...',
      'hi': 'विकल्प चुनें...',
      'as': 'বিকল্প বাছক...',
      'bn': 'একটি বিকল্প নির্বাচন করুন...',
      'brx': 'बिखायथार सायख...',
      'doi': 'इक विकल्प चुनो...',
      'gu': 'વિકલ્પ પસંદ કરો...',
      'kn': 'ಆಯ್ಕೆ ಆರಿಸಿ...',
      'kok': 'पर्याय निवडा...',
      'ks': 'اِختیار ژٲریو...',
      'mai': 'विकल्प चुनू...',
      'ml': 'ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക...',
      'mni': 'চয়ন খন্বীয়ু...',
      'mr': 'पर्याय निवडा...',
      'ne': 'विकल्प चयन गर्नुहोस्...',
      'or': 'ବିକଳ୍ପ ଚୟନ କରନ୍ତୁ...',
      'pa': 'ਵਿਕਲਪ ਚੁਣੋ...',
      'sa': 'विकल्पं चिनुतु...',
      'sat': 'बिकल्प बाछाव मे...',
      'sd': 'اختيار چونڊيو...',
      'ta': 'விருப்பத்தைத் தேர்ந்தெடுக்கவும்...',
      'te': 'ఎంపికను ఎంచుకోండి...',
      'ur': 'اختیار منتخب کریں...',
    };
    return translations[normalizedCode] ?? 'Select an option...';
  }

  /// Translation for "Enter a number..."
  static String getEnterNumber(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Enter a number...',
      'hi': 'संख्या दर्ज करें...',
      'as': 'সংখ্যা দিয়ক...',
      'bn': 'একটি সংখ্যা লিখুন...',
      'brx': 'लिखि हायाव...',
      'doi': 'नंबर पाओ...',
      'gu': 'નંબર દાખલ કરો...',
      'kn': 'ಸಂಖ್ಯೆ ನಮೂದಿಸಿ...',
      'kok': 'नंबर घाला...',
      'ks': 'نَمبَر دَرج کَریو...',
      'mai': 'संख्या दर्ज करू...',
      'ml': 'നമ്പർ നൽകുക...',
      'mni': 'নম্বর হাপচিনবীয়ু...',
      'mr': 'क्रमांक टाका...',
      'ne': 'सङ्ख्या प्रविष्ट गर्नुहोस्...',
      'or': 'ସଂଖ୍ୟା ପ୍ରବେଶ କରନ୍ତୁ...',
      'pa': 'ਨੰਬਰ ਦਾਖਲ ਕਰੋ...',
      'sa': 'सङ्ख्यां प्रविशतु...',
      'sat': 'नंबर दाखिल मे...',
      'sd': 'نمبر داخل ڪريو...',
      'ta': 'எண்ணை உள்ளிடவும்...',
      'te': 'సంఖ్యను నమోదు చేయండి...',
      'ur': 'نمبر درج کریں...',
    };
    return translations[normalizedCode] ?? 'Enter a number...';
  }

  /// Translation for "Select date"
  static String getSelectDateText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Select date',
      'hi': 'तारीख चुनें',
      'as': 'তাৰিখ বাছক',
      'bn': 'তারিখ নির্বাচন করুন',
      'brx': 'अकनाय सायख',
      'doi': 'तारीख चुनो',
      'gu': 'તારીખ પસંદ કરો',
      'kn': 'ದಿನಾಂಕ ಆರಿಸಿ',
      'kok': 'तारीख निवडा',
      'ks': 'تٲریٖخ ژٲریو',
      'mai': 'तिथि चुनू',
      'ml': 'തീയതി തിരഞ്ഞെടുക്കുക',
      'mni': 'তারিখ খন্বীয়ু',
      'mr': 'तारीख निवडा',
      'ne': 'मिति चयन गर्नुहोस्',
      'or': 'ତାରିଖ ଚୟନ କରନ୍ତୁ',
      'pa': 'ਤਾਰੀਖ ਚੁਣੋ',
      'sa': 'दिनाङ्कं चिनुतु',
      'sat': 'तारिक बाछाव मे',
      'sd': 'تاريخ چونڊيو',
      'ta': 'தேதியைத் தேர்ந்தெடுக்கவும்',
      'te': 'తేదీని ఎంచుకోండి',
      'ur': 'تاریخ منتخب کریں',
    };
    return translations[normalizedCode] ?? 'Select date';
  }

  /// Translation for "Select date & time"
  static String getSelectDateAndTime(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Select date & time',
      'hi': 'तारीख और समय चुनें',
      'as': 'তাৰিখ আৰু সময় বাছক',
      'bn': 'তারিখ ও সময় নির্বাচন করুন',
      'brx': 'अकनाय आरो समाव सायख',
      'doi': 'तारीख ते समें चुनो',
      'gu': 'તારીખ અને સમય પસંદ કરો',
      'kn': 'ದಿನಾಂಕ ಮತ್ತು ಸಮಯ ಆರಿಸಿ',
      'kok': 'तारीख आनी वेळ निवडा',
      'ks': 'تٲریٖخ تہٕ وَقَت ژٲریو',
      'mai': 'तिथि आओर समय चुनू',
      'ml': 'തീയതിയും സമയവും തിരഞ്ഞെടുക്കുക',
      'mni': 'তারিখ অমসুং মতম খন্বীয়ু',
      'mr': 'तारीख आणि वेळ निवडा',
      'ne': 'मिति र समय चयन गर्नुहोस्',
      'or': 'ତାରିଖ ଓ ସମୟ ଚୟନ କରନ୍ତୁ',
      'pa': 'ਤਾਰੀਖ ਅਤੇ ਸਮਾਂ ਚੁਣੋ',
      'sa': 'दिनाङ्कं समयं च चिनुतु',
      'sat': 'तारिक आर समय बाछाव मे',
      'sd': 'تاريخ ۽ وقت چونڊيو',
      'ta': 'தேதி மற்றும் நேரத்தைத் தேர்ந்தெடுக்கவும்',
      'te': 'తేదీ మరియు సమయాన్ని ఎంచుకోండి',
      'ur': 'تاریخ اور وقت منتخب کریں',
    };
    return translations[normalizedCode] ?? 'Select date & time';
  }

  /// Translation for "Select time"
  static String getSelectTimeText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Select time',
      'hi': 'समय चुनें',
      'as': 'সময় বাছক',
      'bn': 'সময় নির্বাচন করুন',
      'brx': 'समाव सायख',
      'doi': 'समें चुनो',
      'gu': 'સમય પસંદ કરો',
      'kn': 'ಸಮಯ ಆರಿಸಿ',
      'kok': 'वेळ निवडा',
      'ks': 'وَقَت ژٲریو',
      'mai': 'समय चुनू',
      'ml': 'സമയം തിരഞ്ഞെടുക്കുക',
      'mni': 'মতম খন্বীয়ু',
      'mr': 'वेळ निवडा',
      'ne': 'समय चयन गर्नुहोस्',
      'or': 'ସମୟ ଚୟନ କରନ୍ତୁ',
      'pa': 'ਸਮਾਂ ਚੁਣੋ',
      'sa': 'समयं चिनुतु',
      'sat': 'समय बाछाव मे',
      'sd': 'وقت چونڊيو',
      'ta': 'நேரத்தைத் தேர்ந்தெடுக்கவும்',
      'te': 'సమయాన్ని ఎంచుకోండి',
      'ur': 'وقت منتخب کریں',
    };
    return translations[normalizedCode] ?? 'Select time';
  }

  /// Translation for "Upload Required"
  static String getUploadRequired(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Upload Required',
      'hi': 'अपलोड आवश्यक',
      'as': 'আপলোড আৱশ্যক',
      'bn': 'আপলোড প্রয়োজন',
      'brx': 'अपलोड गोनांथि',
      'doi': 'अपलोड जरूरी',
      'gu': 'અપલોડ જરૂરી',
      'kn': 'ಅಪ್‌ಲೋಡ್ ಅಗತ್ಯ',
      'kok': 'अपलोड गरजेचे',
      'ks': 'اَپلوڈ ضروری',
      'mai': 'अपलोड जरूरी',
      'ml': 'അപ്‌ലോഡ് ആവശ്യമാണ്',
      'mni': 'অপলোদ মথৌ তায়',
      'mr': 'अपलोड आवश्यक',
      'ne': 'अपलोड आवश्यक',
      'or': 'ଅପଲୋଡ୍ ଆବଶ୍ୟକ',
      'pa': 'ਅੱਪਲੋਡ ਲੋੜੀਂਦਾ',
      'sa': 'आरोपणम् आवश्यकम्',
      'sat': 'अपलोड जरुरी',
      'sd': 'اپلوڊ ضروري',
      'ta': 'பதிவேற்றம் தேவை',
      'te': 'అప్‌లోడ్ అవసరం',
      'ur': 'اپ لوڈ ضروری',
    };
    return translations[normalizedCode] ?? 'Upload Required';
  }

  /// Translation for "Progress"
  static String getProgressText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Progress',
      'hi': 'प्रगति',
      'as': 'অগ্ৰগতি',
      'bn': 'অগ্রগতি',
      'brx': 'होजां',
      'doi': 'तरक्की',
      'gu': 'પ્રગતિ',
      'kn': 'ಪ್ರಗತಿ',
      'kok': 'प्रगती',
      'ks': 'تَرَقی',
      'mai': 'प्रगति',
      'ml': 'പുരോഗതി',
      'mni': 'ফৈগত',
      'mr': 'प्रगती',
      'ne': 'प्रगति',
      'or': 'ପ୍ରଗତି',
      'pa': 'ਤਰੱਕੀ',
      'sa': 'प्रगतिः',
      'sat': 'तरक्की',
      'sd': 'ترقي',
      'ta': 'முன்னேற்றம்',
      'te': 'పురోగతి',
      'ur': 'پیش رفت',
    };
    return translations[normalizedCode] ?? 'Progress';
  }

  // ===== SUBMIT/NAVIGATION TRANSLATIONS =====
  // AI-generated translations - verify with native speakers

  /// Translation for "Submit Survey"
  static String getSubmitSurveyText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Submit Survey',
      'hi': 'सबमिट करें',
      'as': 'সৰ্বেক্ষণ জমা দিয়ক',
      'bn': 'সার্ভে জমা দিন',
      'brx': 'सार्भे जमा खालाम',
      'doi': 'सर्वे जमा करो',
      'gu': 'સર્વે સબમિટ કરો',
      'kn': 'ಸಮೀಕ್ಷೆ ಸಲ್ಲಿಸಿ',
      'kok': 'सर्वेक्षण जमा करा',
      'ks': 'سَروے جَمع کَریو',
      'mai': 'सर्वेक्षण जमा करू',
      'ml': 'സർവേ സമർപ്പിക്കുക',
      'mni': 'সার্ভে শেম্বা',
      'mr': 'सर्वेक्षण सबमिट करा',
      'ne': 'सर्भे पेश गर्नुहोस्',
      'or': 'ସର୍ଭେ ଦାଖଲ କରନ୍ତୁ',
      'pa': 'ਸਰਵੇ ਜਮ੍ਹਾਂ ਕਰੋ',
      'sa': 'सर्वेक्षणं समर्पयतु',
      'sat': 'सार्वे जमा मे',
      'sd': 'سروي جمع ڪريو',
      'ta': 'கருத்துக்கணிப்பைச் சமர்ப்பிக்கவும்',
      'te': 'సర్వేను సమర్పించండి',
      'ur': 'سروے جمع کرائیں',
    };
    return translations[normalizedCode] ?? 'Submit Survey';
  }

  /// Translation for "Submit"
  static String getSubmitText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Submit',
      'hi': 'जमा करें',
      'as': 'জমা দিয়ক',
      'bn': 'জমা দিন',
      'brx': 'जमा खालाम',
      'doi': 'जमा करो',
      'gu': 'સબમિટ કરો',
      'kn': 'ಸಲ್ಲಿಸಿ',
      'kok': 'जमा करा',
      'ks': 'جَمع کَریو',
      'mai': 'जमा करू',
      'ml': 'സമർപ്പിക്കുക',
      'mni': 'শেম্বা',
      'mr': 'सबमिट करा',
      'ne': 'पेश गर्नुहोस्',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
      'pa': 'ਜਮ੍ਹਾਂ ਕਰੋ',
      'sa': 'समर्पयतु',
      'sat': 'जमा मे',
      'sd': 'جمع ڪريو',
      'ta': 'சமர்ப்பிக்கவும்',
      'te': 'సమర్పించండి',
      'ur': 'جمع کرائیں',
    };
    return translations[normalizedCode] ?? 'Submit';
  }

  /// Translation for "Exit Survey"
  static String getExitSurveyText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Exit Survey',
      'hi': 'बाहर निकलें',
      'as': 'সৰ্বেক্ষণৰ পৰা ওলাওক',
      'bn': 'সার্ভে থেকে বেরিয়ে যান',
      'brx': 'सार्भे नुथाय',
      'doi': 'सर्वे छड्डो',
      'gu': 'સર્વે છોડો',
      'kn': 'ಸಮೀಕ್ಷೆಯಿಂದ ನಿರ್ಗಮಿಸಿ',
      'kok': 'सर्वेक्षण सोडा',
      'ks': 'سَروے چھوڑیو',
      'mai': 'सर्वेक्षण छोड़ू',
      'ml': 'സർവേയിൽ നിന്ന് പുറത്തുപോകുക',
      'mni': 'সার্ভে থোক্বা',
      'mr': 'सर्वेक्षण सोडा',
      'ne': 'सर्भे छोड्नुहोस्',
      'or': 'ସର୍ଭେ ଛାଡନ୍ତୁ',
      'pa': 'ਸਰਵੇ ਛੱਡੋ',
      'sa': 'सर्वेक्षणं त्यजतु',
      'sat': 'सार्वे छाड मे',
      'sd': 'سروي مان نڪرو',
      'ta': 'கருத்துக்கணிப்பிலிருந்து வெளியேறவும்',
      'te': 'సర్వే నుండి నిష్క్రమించండి',
      'ur': 'سروے سے باہر نکلیں',
    };
    return translations[normalizedCode] ?? 'Exit Survey';
  }

  /// Translation for "Exit"
  static String getExitText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Exit',
      'hi': 'बाहर निकलें',
      'as': 'ওলাওক',
      'bn': 'প্রস্থান করুন',
      'brx': 'नुथाय',
      'doi': 'बाहर निकलो',
      'gu': 'બહાર નીકળો',
      'kn': 'ನಿರ್ಗಮಿಸಿ',
      'kok': 'भायर वचा',
      'ks': 'باہَر وُچھِو',
      'mai': 'बाहर निकलू',
      'ml': 'പുറത്തുപോകുക',
      'mni': 'পোত্থোক-উ',
      'mr': 'बाहेर पडा',
      'ne': 'बाहिर निस्कनुहोस्',
      'or': 'ବାହାରକୁ ଯାଅନ୍ତୁ',
      'pa': 'ਬਾਹਰ ਜਾਓ',
      'sa': 'बहिर्गच्छतु',
      'sat': 'बाहिर मे',
      'sd': 'ٻاهر نڪرو',
      'ta': 'வெளியேறவும்',
      'te': 'నిష్క్రమించండి',
      'ur': 'باہر نکلیں',
    };
    return translations[normalizedCode] ?? 'Exit';
  }

  /// Translation for "Stay"
  static String getStayText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Stay',
      'hi': 'रहें',
      'as': 'থাকক',
      'bn': 'থাকুন',
      'brx': 'थांनाय',
      'doi': 'रौह',
      'gu': 'રહો',
      'kn': 'ಉಳಿಯಿರಿ',
      'kok': 'रावा',
      'ks': 'رَوِو',
      'mai': 'रहू',
      'ml': 'തുടരുക',
      'mni': 'লৈয়ু',
      'mr': 'राहा',
      'ne': 'रहनुहोस्',
      'or': 'ରୁହନ୍ତୁ',
      'pa': 'ਰਹੋ',
      'sa': 'तिष्ठतु',
      'sat': 'रहा मे',
      'sd': 'رهو',
      'ta': 'தங்கவும்',
      'te': 'ఉండండి',
      'ur': 'رہیں',
    };
    return translations[normalizedCode] ?? 'Stay';
  }

  /// Translation for "Confirm"
  static String getConfirmText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Confirm',
      'hi': 'पुष्टि करें',
      'as': 'নিশ্চিত কৰক',
      'bn': 'নিশ্চিত করুন',
      'brx': 'थार खालाम',
      'doi': 'पुष्टी करो',
      'gu': 'પુષ્ટિ કરો',
      'kn': 'ದೃಢೀಕರಿಸಿ',
      'kok': 'खात्री करा',
      'ks': 'تَصدیٖق کَریو',
      'mai': 'पुष्टि करू',
      'ml': 'സ്ഥിരീകരിക്കുക',
      'mni': 'নিংশিংহন্বা',
      'mr': 'पुष्टी करा',
      'ne': 'पुष्टि गर्नुहोस्',
      'or': 'ନିଶ୍ଚିତ କରନ୍ତୁ',
      'pa': 'ਪੁਸ਼ਟੀ ਕਰੋ',
      'sa': 'पुष्टिं कुरुतु',
      'sat': 'पुष्टि मे',
      'sd': 'تصديق ڪريو',
      'ta': 'உறுதிப்படுத்தவும்',
      'te': 'ధృవీకరించండి',
      'ur': 'تصدیق کریں',
    };
    return translations[normalizedCode] ?? 'Confirm';
  }

  /// Translation for "Next"
  static String getNextText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Next',
      'hi': 'अगला',
      'as': 'পৰবৰ্তী',
      'bn': 'পরবর্তী',
      'brx': 'उननै',
      'doi': 'अग्गे',
      'gu': 'આગળ',
      'kn': 'ಮುಂದೆ',
      'kok': 'फुडें',
      'ks': 'بٔیہِ',
      'mai': 'आगां',
      'ml': 'അടുത്തത്',
      'mni': 'শরুক',
      'mr': 'पुढील',
      'ne': 'अर्को',
      'or': 'ପରବର୍ତ୍ତୀ',
      'pa': 'ਅਗਲਾ',
      'sa': 'अग्रिमम्',
      'sat': 'उनाव',
      'sd': 'اڳيون',
      'ta': 'அடுத்தது',
      'te': 'తరువాత',
      'ur': 'اگلا',
    };
    return translations[normalizedCode] ?? 'Next';
  }

  /// Translation for "Previous"
  static String getPreviousText(String languageCode) {
    final normalizedCode = languageCode.toLowerCase();
    const translations = {
      'en': 'Previous',
      'hi': 'पिछला',
      'as': 'পূৰ্ববৰ্তী',
      'bn': 'পূর্ববর্তী',
      'brx': 'उननिसिगोन',
      'doi': 'पिच्छला',
      'gu': 'અગાઉનું',
      'kn': 'ಹಿಂದಿನ',
      'kok': 'आदलो',
      'ks': 'پٔیتھُم',
      'mai': 'पहिल्का',
      'ml': 'മുൻപത്തെ',
      'mni': 'হান্না',
      'mr': 'मागील',
      'ne': 'अघिल्लो',
      'or': 'ପୂର୍ବବର୍ତ୍ତୀ',
      'pa': 'ਪਿਛਲਾ',
      'sa': 'पूर्वम्',
      'sat': 'पहले',
      'sd': 'پويون',
      'ta': 'முந்தையது',
      'te': 'మునుపటి',
      'ur': 'پچھلا',
    };
    return translations[normalizedCode] ?? 'Previous';
  }
}