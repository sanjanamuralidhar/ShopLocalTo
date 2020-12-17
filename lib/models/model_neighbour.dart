import 'package:listar_flutter/configs/image.dart';

class NeighbourModel {
  String status;
  String imageUrl;
  bool favorite;
  String subtitle;
  String title;
  String rating;
  double ratingCount;
  String address;



  NeighbourModel({
   this.address,
   this.favorite,
   this.imageUrl,
   this.rating,
   this.ratingCount,
   this.status,
   this.subtitle,
   this.title
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
  ),
];
// class Destination {
//   String imageUrl;
//   String city;
//   String country;
//   String description;

//   Destination({
//     this.imageUrl,
//     this.city,
//     this.country,
//     this.description,
  
//   });
// }


// List<Destination> destinations = [
//   Destination(
//     imageUrl: 'assets/images/venice.jpg',
//     city: 'Venice',
//     country: 'Italy',
//     description: 'Visit Venice for an amazing and unforgettable adventure.',

//   ),
//   Destination(
//     imageUrl: 'assets/images/paris.jpg',
//     city: 'Paris',
//     country: 'France',
//     description: 'Visit Paris for an amazing and unforgettable adventure.',

//   ),
//   Destination(
//     imageUrl: 'assets/images/newdelhi.jpg',
//     city: 'New Delhi',
//     country: 'India',
//     description: 'Visit New Delhi for an amazing and unforgettable adventure.',

//   ),
//   Destination(
//     imageUrl: 'assets/images/saopaulo.jpg',
//     city: 'Sao Paulo',
//     country: 'Brazil',
//     description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',

//   ),
//   Destination(
//     imageUrl: 'assets/images/newyork.jpg',
//     city: 'New York City',
//     country: 'United States',
//     description: 'Visit New York for an amazing and unforgettable adventure.',
//   ),
// ];

