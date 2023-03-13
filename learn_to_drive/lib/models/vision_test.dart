List<VisionTest> visionTestFromJson(
        List<dynamic> visionTestJson) =>
    List<VisionTest>.from(visionTestJson.map((visionTestJson) =>
        VisionTest.fromJson(visionTestJson)));

class VisionTest {
  int? id;
  String? number;
  String? image;
  String? createdAt;
  String? updatedAt;

  VisionTest(
      {this.id, this.number, this.image, this.createdAt, this.updatedAt});

  VisionTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}