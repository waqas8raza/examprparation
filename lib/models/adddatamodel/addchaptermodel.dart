class Chaptermodel {
  String id;
  String chapter;

  Chaptermodel({
    required this.id,
    required this.chapter,
  });

  factory Chaptermodel.fromJson(Map<String, dynamic> json) {
    return Chaptermodel(
      id: json['id'] ?? '',
      chapter: json['chapter'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapter': chapter,
    };
  }
}
