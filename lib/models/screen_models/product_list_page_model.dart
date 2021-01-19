import 'package:listar_flutter/models/model.dart';

class ProductListPageModel {
  bool success;
    String message;
   List<ListModel> list;

  ProductListPageModel(
    this.success,
    this.message,
    this.list,
  );

   @override
  String toString() {
    return toJson().toString();
  }

  ProductListPageModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    success = json['success'];
    message = json['message'];
   list=_setList(json['list']);  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(success!=null) json['success']=success;
    if(message!=null) json['message']=message;
    if (list != null) json['list'] = list;
    return json;
  }

    static List<ListModel> _setList(list) {
    if (list != null) {
      final Iterable refactorFeature = list;
      return refactorFeature.map((item) {
        return ListModel.fromJson(item);
      }).toList();
    }
    return null;
  }

  static List<ProductListPageModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ProductListPageModel>()
        : json.map((value) => ProductListPageModel.fromJson(value)).toList();
  }

  // factory ProductListPageModel.fromJson(Map<String, dynamic> json) {
  //   final Iterable refactorList = json['list'] ?? [];

  //   final list = refactorList.map((item) {
  //     return ProductModel.fromJson(item);
  //   }).toList();

  //   return ProductListPageModel(list);
  // }
}
