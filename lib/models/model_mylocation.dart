

class MyLocation {
  int id;
  String title;
  String subtitle;
  String image;

  MyLocation(
    this.id,
    this.title,
    this.subtitle,
    this.image,
    
  );

   @override
  String toString() {
    return toJson().toString();
  }

  MyLocation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
    
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (title != null) json['title'] = title;
    if (subtitle != null) json['subtitle'] = subtitle;
    if (image != null) json['image'] = image;
    
    return json;
  }

  static List<MyLocation> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MyLocation>()
        : json.map((value) => MyLocation.fromJson(value)).toList();
  }
}
