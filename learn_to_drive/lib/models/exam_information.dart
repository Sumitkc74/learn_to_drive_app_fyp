List<ExamInformation> examInformationFromJson(
        List<dynamic> examInformationJson) =>
    List<ExamInformation>.from(examInformationJson.map((examInformationJson) =>
        ExamInformation.fromJson(examInformationJson)));

class ExamInformation {
  int? id;
  String? name;
  String? description;
  String? file;
  String? createdAt;
  String? updatedAt;

  ExamInformation(
      {this.id,
      this.name,
      this.description,
      this.file,
      this.createdAt,
      this.updatedAt});

  ExamInformation.fromJson(Map<String, dynamic> json) {
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