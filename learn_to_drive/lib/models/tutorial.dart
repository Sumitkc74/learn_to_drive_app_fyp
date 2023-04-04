List<Tutorial> tutorialFromJson(
        List<dynamic> tutorialJson) =>
    List<Tutorial>.from(tutorialJson.map((tutorialJson) =>
        Tutorial.fromJson(tutorialJson)));

class Tutorial {
  int? id;
  String? title;
  String? description;
  String? videoLink;
  String? createdAt;
  String? updatedAt;

  Tutorial(
      {this.id,
      this.title,
      this.description,
      this.videoLink,
      this.createdAt,
      this.updatedAt});

  Tutorial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    videoLink = json['videoLink'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['videoLink'] = videoLink;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}