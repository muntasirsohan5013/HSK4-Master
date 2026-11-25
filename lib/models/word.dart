class Word {
  final int? id;
  final String chinese;
  final String pinyin;
  final String english;
  final String exampleChinese;
  final String examplePinyin;
  final String exampleEnglish;

  Word({
    this.id,
    required this.chinese,
    required this.pinyin,
    required this.english,
    required this.exampleChinese,
    required this.examplePinyin,
    required this.exampleEnglish,
  });

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      id: map["id"],
      chinese: map["chinese"],
      pinyin: map["pinyin"],
      english: map["english"],
      exampleChinese: map["exampleChinese"],
      examplePinyin: map["examplePinyin"],
      exampleEnglish: map["exampleEnglish"],
    );
  }
}
