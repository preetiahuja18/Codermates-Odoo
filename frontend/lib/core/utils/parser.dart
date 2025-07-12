  String? pasreString(val) {
    String? string;

    if(val != null
      && (val is String || val is int || val is double)
    ) {
      if(val.toString().trim().isNotEmpty) {
        string = val.toString();
      }
    }

    return string;
  }