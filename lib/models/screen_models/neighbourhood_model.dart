// import 'package:listar_flutter/models/model.dart';

// import '../model_neighbour.dart';

// enum NeighbourhoodType {
//  all_category,
//  hotels,
//  restaurants,
//  events,
//  fitness
// }

// class NeighbourhoodModel {
//   final int id;
//   final String title;
//   final String description;
//   final String image;
//   final num rate;
//   final num numRate;
//   final String address;
//   final List<ImageModel> photo;
//   final List<IconModel> service;
//   final List<NeighbourhoodModel> feature;
//   final List<NeighbourhoodModel> related;
//   final LocationModel location;
//   final NeighbourhoodType type;
//   final NeighbourModel neighbour;

//   NeighbourhoodModel(
//     this.id,
//     this.title,
//     this.image,
//     this.rate,
//     this.numRate,
//     this.address,
//     this.description,
//     this.service,
//     this.photo,
//     this.feature,
//     this.related,
//     this.location,
//     this.type,
//     this.neighbour,
//   );

//   static List<IconModel> _setService(icon) {
//     if (icon != null) {
//       final Iterable refactorService = icon;
//       return refactorService.map((item) {
//         return IconModel.fromJson(item);
//       }).toList();
//     }
//     return null;
//   }

//   static List<ImageModel> _setPhoto(photo) {
//     if (photo != null) {
//       final Iterable refactorPhoto = photo;
//       return refactorPhoto.map((item) {
//         return ImageModel.fromJson(item);
//       }).toList();
//     }
//     return null;
//   }

//   static List<NeighbourhoodModel> _setFeature(feature) {
//     if (feature != null) {
//       final Iterable refactorFeature = feature;
//       return refactorFeature.map((item) {
//         return NeighbourhoodModel.fromJson(item);
//       }).toList();
//     }
//     return null;
//   }

//   static List<NeighbourhoodModel> _setRelated(related) {
//     if (related != null) {
//       final Iterable refactorRelated = related;
//       return refactorRelated.map((item) {
//         return NeighbourhoodModel.fromJson(item);
//       }).toList();
//     }
//     return null;
//   }

//   static LocationModel _setLocation(Map<String, dynamic> location) {
//     if (location != null) {
//       return LocationModel.fromJson(location);
//     }
//     return null;
//   }

//   static NeighbourModel _setNeighbour(Map<String, dynamic> neighbour) {
//     if (neighbour != null) {
//       return NeighbourModel.fromJson(neighbour);
//     }
//     return null;
//   }


//   static NeighbourhoodType _setType(String type) {
//     switch (type) {
//       case 'all_category':
//         return NeighbourhoodType.all_category;
//       case 'hotels':
//         return NeighbourhoodType.hotels;
//       case 'restaurants':
//         return NeighbourhoodType.restaurants;
//       case 'events':
//         return NeighbourhoodType.events;
//       default:
//         return NeighbourhoodType.fitness;
//     }
//   }

//   factory NeighbourhoodModel.fromJson(Map<String, dynamic> json) {
//     return NeighbourhoodModel(
//       json['id'] as int ?? 0,
//       json['title'] as String ?? 'Unknown',
//       json['image'] as String ?? 'Unknown',
//       json['rate'] as num ?? 0,
//       json['num_rate'] as num ?? 0,
//       json['address'] as String ?? 'Unknown',
//       json['description'] as String ?? 'Unknown',
//       _setService(json['service']),
//       _setPhoto(json['photo']),
//       _setFeature(json['feature']),
//       _setRelated(json['related']),
//       _setLocation(json['location']),
//       _setType(json['type']),
//       _setNeighbour(json['neighbour'])
//     );
//   }
// }
