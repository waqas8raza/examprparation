class Titlemodel {
  String id;
  String title;

  Titlemodel({
    required this.id,
    required this.title,
  });

  factory Titlemodel.fromJson(Map<String, dynamic> json) {
    return Titlemodel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
