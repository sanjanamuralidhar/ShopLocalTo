import 'package:listar_flutter/models/model.dart';

class ProductDetailTabPageModel {
   ProductModel product;
   List<TabModel> tab;

  ProductDetailTabPageModel(
    this.product,
    this.tab,
  );

  static List<TabModel> _setTab(tab) {
    if (tab != null) {
      final Iterable refactorTab = tab ?? [];
      return refactorTab.map((item) {
        return TabModel.fromJson(item);
      }).toList();
    }
    return null;
  }
 ProductDetailTabPageModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    product = json['product'];
    tab =_setTab( json['tab']); 
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (product != null) json['product'] = product;
    if (tab != null) json['tab'] = tab;

    return json;
  }

  static List<ProductDetailTabPageModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ProductDetailTabPageModel>()
        : json.map((value) => ProductDetailTabPageModel.fromJson(value)).toList();
  }
  // factory ProductDetailTabPageModel.fromJson(Map<String, dynamic> json) {
  //   return ProductDetailTabPageModel(
  //     ProductModel.fromJson(json),
  //     _setTab(json['tab']),
  //   );
  // }

}
