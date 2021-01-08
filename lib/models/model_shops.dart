import 'package:listar_flutter/configs/image.dart';
import 'package:listar_flutter/models/model.dart';

class ShopModel {
  int id;
  String type;
  String title;
  String subtitle;
  String image;
  String created_date;
  double rate;
  int num_rate;
  String rate_text;
  String status;
  bool favourite;
  String address;
  String phone;
  List<LocationModel> location;

  ShopModel({
   this.id,
  this.type,
  this.title,
  this.subtitle,
  this.image,
  this.created_date,
this.rate,
  this.num_rate,
  this.rate_text,
  this.status,
  this.favourite,
  this.address,
  this.phone,
  List<LocationModel> location,
  });

  
 ShopModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    address = json['address'];
    _setLocation(json['location']);
    type = json['type'];
    image= json['image'];
    created_date = json['created_date'];
    rate = json['rate'];
    num_rate = json['num_rate'];
    rate_text = json['rate_text'];
    favourite = json['favourite'];
    phone = json['phone'];
    status = json['status'];
    subtitle = json['subtitle'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (address != null) json['address'] = address;
    if (location != null) json['location'] = location;
    if (type!=null) json['type'] = type;
    if (image!=null) json['image'] =type;
    if(created_date!=null) json['created_date'] = created_date;
    if(rate!=null) json['rate'] = rate;
    if(num_rate!=null) json['num_rate'] = num_rate;
    if(rate_text!=null) json['rate_text']=rate_text;
    if(favourite!=null) json['favourite']=favourite;
    if(phone!=null) json['phone']=phone;
        if (status != null) json['status'] = status;
    if (subtitle != null) json['subtitle'] = subtitle;
    if (title != null) json['title'] = title;
    return json;
  }

  static List<ShopModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ShopModel>()
        : json.map((value) => ShopModel.fromJson(value)).toList();
  }

   static LocationModel _setLocation(Map<String, dynamic> location) {
    if (location != null) {
      return LocationModel.fromJson(location);
    }
    return null;
  }

}

// List<ShopModel> shopModels = [
//   ShopModel(
//     id:1,
//     address:"667 Wegyard Garden Suit",
//     favorite: false,
//     imageUrl: Images.Location1,
//     rating: "4.0",
//     ratingCount: 4,
//     status: "Open Now",
//     subtitle: "Arts and Humanities",
//     title: "Launge Coffe Bar",
//     description: "urban neighbourhood, lot to explore make your day good",
//     locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"


//   ),
//   ShopModel(
//     id:2,
//    address:"667 Wegyard Garden Suit",
//     favorite: false,
//     imageUrl: Images.Location2,
//     rating: "4.0",
//     ratingCount: 4,
//     status: "Open Now",
//     subtitle: "Arts and Humanities",
//     title: "cozy royal room",
//     description: "urban neighbourhood, lot to explore make your day good",
//     locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
//   ),
//   ShopModel(
//     id:3,
//     address:"667 Wegyard Garden Suit",
//     favorite: false,
//     imageUrl: Images.Location3,
//     rating: "4.0",
//     ratingCount: 4,
//     status: "Open Now",
//     subtitle: "Arts and Humanities",
//     title: "Adorable Room",
//     description: "urban neighbourhood, lot to explore make your day good",
//     locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"

//   ),
//   ShopModel(
//     id:4,
//     address:"667 Wegyard Garden Suit",
//     favorite: false,
//     imageUrl: Images.Location4,
//     rating: "4.0",
//     ratingCount: 4,
//     status: "Open Now",
//     subtitle: "Arts and Humanities",
//     title: "Vallejo",
//     description: "urban neighbourhood, lot to explore make your day good",
//     locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
//   ),
//   ShopModel(
//     id:5,
//     address:"667 Wegyard Garden Suit",
//     favorite: false,
//     imageUrl: Images.Location5,
//     rating: "4.0",
//     ratingCount: 4,
//     status: "Open Now",
//     subtitle: "Arts and Humanities",
//     title: "Park loyal",
//     description: "urban neighbourhood, lot to explore make your day good",
//     locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
//   ),
// ];

// class LeaderBoard {
//   // List<NeighbourImages> images; 
//   String name;
//   int number;
  


//   LeaderBoard({
//    this.name,
//    this.number,
//   });
// }