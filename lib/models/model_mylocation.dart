
enum LocationType {
  place,
  hotel,
  shop,
  drink,
  event,
  estate,
  job,
  restaurant,
  automotive,
  more
}
class MyLocation {
  int id;
  String title;
  String subtitle;
  String image;
  LocationType type;

  MyLocation(
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.type,
    
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
    type=_setType(json['type']);
    
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (title != null) json['title'] = title;
    if (subtitle != null) json['subtitle'] = subtitle;
    if (image != null) json['image'] = image;
    if (type!=null) json['type'] = type;
    
    return json;
  }

  static List<MyLocation> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MyLocation>()
        : json.map((value) => MyLocation.fromJson(value)).toList();
  }
   static LocationType _setType(String type) {
    switch (type) {
      case 'hotel':
        return LocationType.hotel;
      case 'shop':
        return LocationType.shop;
      case 'drink':
        return LocationType.drink;
      case 'event':
        return LocationType.event;
      case 'estate':
        return LocationType.estate;
      case 'job':
        return LocationType.job;
      case 'restaurant':
        return LocationType.restaurant;
      case 'automotive':
        return LocationType.automotive;
      default:
        return LocationType.place;
    }
  }
}
