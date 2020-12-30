import 'package:listar_flutter/models/model.dart';

class PopularPageModel {
  String status;
  String message;
  
  List<MyLocation> list;

  PopularPageModel(
    this.status,
    this.message,
    this.list,
  );


  // factory PopularPageModel.fromJson(dynamic json) {
  //   final Iterable refactorList = json['list'] ?? [];

  //   final listProduct = refactorList.map((item) {
  //     return MyLocation.fromJson(item);
  //   }).toList();


  //   return PopularPageModel(
  //     json['status'] as String ?? 'Unknown',
  //     json['message'] as String ?? 'Unknown',
  //     listProduct,
  //   );
  // }
  PopularPageModel.fromJson(Map<String, dynamic> json){
    if(json==null)return;
    status = json['status'];
    message = json['message'];
    list = json['list'];
  }
Map<String, dynamic> toJson(){
  Map<String, dynamic> json = {};
  if(status != null) json['status'] = status;
   if(message != null) json['message'] = message;
    if(list != null) json['list'] = list;
  return json;
}


}