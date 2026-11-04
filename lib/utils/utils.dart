String? presetAllowForLabel(String label) {
  switch (label) {
    case 'Email':
      return r"[a-zA-Z0-9._%+\-@]";
    case 'Indian Mobile':
      return r"[0-9+\-\s]";
    case 'Letters Only':
      return r"[A-Za-z]";
    case 'Letters & Spaces':
      return r"[A-Za-z ]";
    case 'Alphanumeric':
      return r"[A-Za-z0-9]";
    case 'Alphanumeric & Spaces':
      return r"[A-Za-z0-9 ]";
    case 'Indian PIN':
      return r"[0-9]";
    case 'URL (http/https)':
      return r"[A-Za-z0-9:\/._?#&=%@\-~+,]";
    case 'Date YYYY-MM-DD':
      return r"[0-9\-]";
    case 'Time HH:MM':
      return r"[0-9:]";
    default:
      return null;
  }
}

// Preset full validation regex for labels
String? presetPatternForLabel(String label) {
  switch (label) {
    case 'Email':
      return r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[A-Za-z]{2,}$';
    case 'Indian Mobile':
      return r'^(?:\+91[\-\s]?|0)?[6-9]\d{9}$';
    case 'Letters Only':
      return r'^[A-Za-z]+$';
    case 'Letters & Spaces':
      return r'^[A-Za-z ]+$';
    case 'Alphanumeric':
      return r'^[A-Za-z0-9]+$';
    case 'Alphanumeric & Spaces':
      return r'^[A-Za-z0-9 ]+$';
    case 'Indian PIN':
      return r'^[1-9][0-9]{5}$';
    case 'URL (http/https)':
      return r'^(?:https?:\/\/)?[\w-]+(\.[\w-]+)+([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?$';
    case 'Date YYYY-MM-DD':
      return r'^\d{4}-\d{2}-\d{2}$';
    case 'Time HH:MM':
      return r'^([01]\d|2[0-3]):[0-5]\d$';
    default:
      return null;
  }
}

// Preset user-facing error message for labels
String? presetMessageForLabel(String label) {
  switch (label) {
    case 'Email':
      return 'Please enter a valid email address.';
    case 'Indian Mobile':
      return 'Enter a valid Indian mobile number.';
    case 'Letters Only':
      return 'Only letters are allowed.';
    case 'Letters & Spaces':
      return 'Use letters and spaces only.';
    case 'Alphanumeric':
      return 'Use letters and numbers only.';
    case 'Alphanumeric & Spaces':
      return 'Letters, numbers and spaces only.';
    case 'Indian PIN':
      return 'Enter a valid 6-digit PIN code.';
    case 'URL (http/https)':
      return 'Enter a valid URL.';
    case 'Date YYYY-MM-DD':
      return 'Enter date as YYYY-MM-DD.';
    case 'Time HH:MM':
      return 'Enter time as HH:MM (24h).';
    default:
      return null;
  }
}
