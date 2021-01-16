
import 'package:listar_flutter/models/model.dart';

enum PopularType {
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
class PopularModel {
  int id;
  bool success;
  String name;
  String message;
  String slug;
  String picture;
  String description;
  double latitude;
  int longitude;
  
  List<NearbyModel> nearby;
  PopularType model;

  PopularModel({
   this.id,
  this.success,
  this.name,
  this.message,
  this.slug,
  this.picture,
this.description,
  this.latitude,
  this.longitude,
  this.model,
  this.nearby,
  });

  
 PopularModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    // location = _setLocation(json['location']);
    message = json['message'];
    slug= json['slug'];
    picture = json['picture'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    model = json['model'];
    success = json['success'];
    model=_setType(json['type']);
    nearby=_setNearby(json['nearby']);
    
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (message != null) json['message'] = message;
    if (slug!=null) json['slug'] = slug;
    if (picture!=null) json['picture'] =picture;
    if(description!=null) json['description'] = description;
    if(latitude!=null) json['latitude'] = latitude;
    if(longitude!=null) json['longitude'] = longitude;
    if(model!=null) json['model']=model;
    if(success!=null) json['success']=success;
   if(nearby !=null) json['nearby'] = nearby;
    return json;
  }

  static PopularType _setType(String type) {
    switch (type) {
      case 'hotel':
        return PopularType.hotel;
      case 'shop':
        return PopularType.shop;
      case 'drink':
        return PopularType.drink;
      case 'event':
        return PopularType.event;
      case 'estate':
        return PopularType.estate;
      case 'job':
        return PopularType.job;
      case 'restaurant':
        return PopularType.restaurant;
      case 'automotive':
        return PopularType.automotive;
      default:
        return PopularType.place;
    }
  }

  static List<PopularModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<PopularModel>()
        : json.map((value) => PopularModel.fromJson(value)).toList();
  }

  static List<LocationModel> _setLocation(List<dynamic> json) {
    return json == null
        ? List<LocationModel>()
        : json.map((value) => LocationModel.fromJson(value)).toList();
  }
   static List<NearbyModel> _setNearby(nearly) {
    if (nearly != null) {
      final Iterable refactorFeature = nearly;
      return refactorFeature.map((item) {
        return NearbyModel.fromJson(item);
      }).toList();
    }
    return null;
  }
  

}