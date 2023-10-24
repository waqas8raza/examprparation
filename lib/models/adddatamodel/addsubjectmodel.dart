class Subjectmodel {
  String id;
  String subject;

  Subjectmodel({
    required this.id,
    required this.subject,
  });

  factory Subjectmodel.fromJson(Map<String, dynamic> json) {
    return Subjectmodel(
      id: json['id'] ?? '',
      subject: json['subject'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subject,
    };
  }
}
