

import 'package:flutter/cupertino.dart';
import 'package:listar_flutter/models/model.dart';



class CategoryModel2 {
  int id;
  String title;
  String count;
  String image;
  String icon;
  String color;
  ProductType type;


  CategoryModel2({
    this.id,
    this.title,
    this.count,
    this.image,
    this.icon,
    this.color,
    this.type,
  });

  static ProductType _setType(String type) {
    switch (type) {
      case 'shop':
        return ProductType.shop;
      case 'drink':
        return ProductType.drink;
      case 'event':
        return ProductType.event;
      case 'estate':
        return ProductType.estate;
      case 'job':
        return ProductType.job;
      case 'restaurant':
        return ProductType.restaurant;
      case 'automotive':
        return ProductType.automotive;
      case 'hotel':
        return ProductType.hotel;
      default:
        return ProductType.more;
    }
  }

   CategoryModel2.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    count = json['count'];
    image = json['image'];
    icon =  json['icon'];
    color =  json['color'];
    type = _setType(json['type']);

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (title != null) json['title'] = title;
    if (count != null) json['count'] = count;
    if (image != null) json['image'] = image;
    if (icon != null)  json['icon'] = icon;
    if (color != null)  json['color'] = color;
    if(type != null) json['type'] = type;
    return json;
  }

  static List<CategoryModel2> listFromJson(List<dynamic> json) {
    return json == null
        ? List<CategoryModel2>()
        : json.map((value) => CategoryModel2.fromJson(value)).toList();
  }

}