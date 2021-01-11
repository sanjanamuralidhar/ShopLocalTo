import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model.dart';

class TabModel {
  int id;
  String key;
  GlobalKey keyContentItem;
  GlobalKey keyTabItem;
  String title;
  List<ProductModel> list;

  TabModel(
    this.id,
    this.key,
    this.keyContentItem,
    this.keyTabItem,
    this.title,
    this.list,
  );

  

  TabModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
    keyContentItem = json['keyContentItem'];
    keyTabItem = json['keyTabItem'];
    title = json['title'];
    _setList(json['list']);

    
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (key!= null) json['key'] = key;
    if(keyContentItem!=null) json['keyContentItem']=keyContentItem;
    if(keyTabItem!=null) json['keyTabItem']=keyTabItem;
    if(title!=null) json['title']=title;
    if(list!=null) json['list']=list;
    return json;
  }

   static List<TabModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<TabModel>()
        : json.map((value) => TabModel.fromJson(value)).toList();
  }

static List<ProductModel> _setList(list) {
    if (list != null) {
      final Iterable refactorList = list;
      return refactorList.map((item) {
        return ProductModel.fromJson(item);
      }).toList();
    }
    return null;
  }
  // factory TabModel.fromJson(Map<String, dynamic> json) {
  //   return TabModel(
  //     json['id'] as int ?? 0,
  //     json['key'] as String ?? 'Unknown',
  //     GlobalKey(),
  //     GlobalKey(),
  //     json['title'] as String ?? 'Unknown',
  //     _setList(json['list']),
  //   );
  // }
}
