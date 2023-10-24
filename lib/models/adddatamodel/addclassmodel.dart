class Classmodel {
  String id;
  String classValue;

  Classmodel({
    required this.id,
    required this.classValue,
  });

  factory Classmodel.fromJson(Map<String, dynamic> json) {
    return Classmodel(
      id: json['id'] ?? '',
      classValue: json['class'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class': classValue,
    };
  }
}
