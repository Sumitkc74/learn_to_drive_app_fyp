List<ExamPaper> examPaperFromJson(
        List<dynamic> examPaperJson) =>
    List<ExamPaper>.from(examPaperJson.map((examPaperJson) =>
        ExamPaper.fromJson(examPaperJson)));

class ExamPaper {
  int? id;
  String? name;
  String? description;
  String? file;
  String? createdAt;
  String? updatedAt;

  ExamPaper(
      {this.id,
      this.name,
      this.description,
      this.file,
      this.createdAt,
      this.updatedAt});

  ExamPaper.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['file'] = file;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}