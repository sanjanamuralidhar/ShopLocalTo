import 'package:listar_flutter/configs/image.dart';

class NeighbourModel {
  // List<NeighbourImages> images; 
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



  NeighbourModel({
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
}

List<NeighbourModel> neighbourModels = [
  NeighbourModel(
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
  NeighbourModel(
   address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location2,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Launge Coffe Bar",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
  ),
  NeighbourModel(
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location3,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Launge Coffe Bar",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"

  ),
  NeighbourModel(
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location4,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Launge Coffe Bar",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Brampton",
    locationDescription: "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo"
  ),
  NeighbourModel(
    address:"667 Wegyard Garden Suit",
    favorite: false,
    imageUrl: Images.Location5,
    rating: "4.0",
    ratingCount: 4,
    status: "Open Now",
    subtitle: "Arts and Humanities",
    title: "Launge Coffe Bar",
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