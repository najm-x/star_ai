class SqliteKeys {
  SqliteKeys._();
  static Summary get summary => const Summary();
}

class Summary {
  String get id => 'id';
  String get summaryTable => 'summary';
  String get vdUrlColumn => 'vdUrl';
  String get vdTitleColumn => "vdTitle";
  String get vdLangColumn => "vdLang";
  String get vdImageColumn => "vdImage";
  String get summaryContentColumn => "summaryContent";

  const Summary();
}
