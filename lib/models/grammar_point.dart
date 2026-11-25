class GrammarPoint {
  final int? id;
  final String title;
  final String explanationChinese;
  final String explanationEnglish;
  final String example;
  final String fillQuestion;
  final String fillAnswer;

  GrammarPoint({
    this.id,
    required this.title,
    required this.explanationChinese,
    required this.explanationEnglish,
    required this.example,
    required this.fillQuestion,
    required this.fillAnswer,
  });

  factory GrammarPoint.fromMap(Map<String, dynamic> map) {
    return GrammarPoint(
      id: map["id"],
      title: map["title"],
      explanationChinese: map["explanationChinese"],
      explanationEnglish: map["explanationEnglish"],
      example: map["example"],
      fillQuestion: map["fillQuestion"],
      fillAnswer: map["fillAnswer"],
    );
  }
}
