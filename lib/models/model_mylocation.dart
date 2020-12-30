import 'package:listar_flutter/models/model.dart';

class MyLocation {
  int id;
  String name;
  String slug;
  String description;
  String latitude;
  String longitude;
  String image;
  String created_at;
  String updated_at;
  int district_id;
  int display_home;

  MyLocation(
    this.id,
    this.created_at,
    this.description,
    this.display_home,
    this.district_id,
    this.image,
    this.latitude,
    this.longitude,
    this.name,
    this.slug,
    this.updated_at,
  );

   @override
  String toString() {
    return toJson().toString();
  }


  // factory MyLocation.fromJson(dynamic json) {
  //   return MyLocation(
  //     json['id'] as int ?? 0,
  //     json['created_at'] as String ?? 'Unknown',
  //     json['description'] as String ?? 'Unknown',
  //     json['display_home'] as int ?? 'Unknown',
  //     json['district_id'] as int ?? 'Unknown',
  //     json['image'] as String ?? 'Unknown',
  //     json['latitude'] as String ?? 'Unknown',
  //     json['longitude'] as String ?? 'Unknown',
  //     json['name'] as String ?? 'Unknown',
  //     json['slug'] as String ?? 'Unknown',
  //     json['updated_at'] as String ?? 'Unknown',

  //   );
  // }
  MyLocation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    created_at = json['created_at'];
    description = json['description'];
    display_home = json['display_home'];
    district_id = json['district_id'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    slug = json['slug'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (created_at != null) json['created_at'] = created_at;
    if (description != null) json['description'] = description;
    if (display_home != null) json['display_home'] = display_home;
    if (district_id != null) json['district_id'] = district_id;
    if (image != null) json['image'] = image;
    if (latitude != null) json['latitude'] = latitude;
    if (longitude != null) json['longitude'] = longitude;
    if (name != null) json['name'] = name;
    if (slug != null) json['slug'] = slug;
    if (updated_at != null) json['updated_at'] = updated_at;
    return json;
  }

  static List<MyLocation> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MyLocation>()
        : json.map((value) => MyLocation.fromJson(value)).toList();
  }
}
