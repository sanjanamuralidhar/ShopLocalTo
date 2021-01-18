class ImageModel {
  int id;
  String image;

  ImageModel(
    this.id,
    this.image,
  );
   @override
  String toString() {
    return toJson().toString();
  }

  ImageModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
   id = json['id'];
    image = json['image'];
    
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (image != null) json['image'] = image;
    return json;
  }
  static List<ImageModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ImageModel>()
        : json.map((value) => ImageModel.fromJson(value)).toList();
  }
}
