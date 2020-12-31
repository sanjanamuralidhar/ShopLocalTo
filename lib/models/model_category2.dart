import 'package:flutter/cupertino.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/utils/utils.dart';

class CategoryModel2 {
  int id;
  String title;
  int count;
  String image;
  IconData icon;
  Color color;
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

   CategoryModel2.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    count = json['count'];
    image = json['image'];
    icon = icon;
    color = color;
    type = type;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (title != null) json['title'] = title;
    if (count != null) json['count'] = count;
    if (image != null) json['image'] = image;
    if (icon != null) icon = icon;
    if (color != null) color = color;
    if (type != null) type = type;
    return json;
  }

  static List<CategoryModel2> listFromJson(List<dynamic> json) {
    return json == null
        ? List<CategoryModel2>()
        : json.map((value) => CategoryModel2.fromJson(value)).toList();
  }
}