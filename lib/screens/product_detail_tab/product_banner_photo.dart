import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:shimmer/shimmer.dart';

class ProductBannerHeader extends SliverPersistentHeaderDelegate {
  final double height;
  final ImageModel productModel;


  ProductBannerHeader({this.height, this.productModel});
  @override
  Widget build(context,shrinkOffset, overlapsContent) {
    if(productModel==null){
     return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      );
    }
   return ListView(
  scrollDirection: Axis.horizontal, // <-- Like so
  children: <Widget>[
    Container(
      child: Image.network(productModel.image,
      fit: BoxFit.cover,
    )),
  ],
);
  }
  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}