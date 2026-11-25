class WritingEntry {
  final int? id;
  final String content;
  final String createdAt;

  WritingEntry({
    this.id,
    required this.content,
    required this.createdAt,
  });

  factory WritingEntry.fromMap(Map<String, dynamic> map) {
    return WritingEntry(
      id: map["id"],
      content: map["content"],
      createdAt: map["createdAt"],
    );
  }
}
