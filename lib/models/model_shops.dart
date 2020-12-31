import 'package:listar_flutter/configs/image.dart';

class ShopModel {
  // List<NeighbourImages> images; 
  int id;
  String location;
  String locationDescription;
  String status;
  String imageUrl;
  bool favorite;
  String subtitle;
  String title;
  String rating;
  double ratingCount;
  String address;
  String description;



  ShopModel({
    this.id,
   this.address,
   this.location,
   this.favorite,
   this.imageUrl,
   this.rating,
   this.ratingCount,
   this.status,
   this.subtitle,
   this.title,
   this.description,
   this.locationDescription,
  //  this.images
  });

 ShopModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    address = json['address'];
    location = json['location'];
    favorite = json['favorite'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    status = json['status'];
    subtitle = json['subtitle'];
    title = json['title'];
    description = json['description'];
    locationDescription = json['locationDescription'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (address != null) json['created_at'] = address;
    if (location != null) json['description'] = location;
    if (favorite != null) json['display_home'] = favorite;
    if (imageUrl != null) json['district_id'] = imageUrl;
    if (rating != null) json['image'] = rating;
    if (ratingCount != null) json['latitude'] = ratingCount;
    if (status != null) json['longitude'] = status;
    if (subtitle != null) json['name'] = subtitle;
    if (title != null) json['slug'] = title;
    if (description != null) json['updated_at'] = description;
    if (locationDescription != null) json['updated_at'] = locationDescription;
    return json;
  }

  static List<ShopModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ShopModel>()
        : json.map((value) => ShopModel.fromJson(value)).toList();
  }
}

List<ShopModel> shopModels = [
  ShopModel(
    id:1,
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location1,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Launge Coffe Bar",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"


  ),
  ShopModel(
    id:2,
   address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location2,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "cozy royal room",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
  ),
  ShopModel(
    id:3,
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location3,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Adorable Room",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"

  ),
  ShopModel(
    id:4,
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location4,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Vallejo",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
  ),
  ShopModel(
    id:5,
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location5,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Park loyal",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
  ),
];

class LeaderBoard {
  // List<NeighbourImages> images; 
  String name;
  int number;
  


  LeaderBoard({
   this.name,
   this.number,
  });
}