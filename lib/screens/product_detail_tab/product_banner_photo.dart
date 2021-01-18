import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:shimmer/shimmer.dart';

class ProductBannerHeader extends StatelessWidget {
  final double height;
  final ImageModel imageModel;


  ProductBannerHeader({this.height, this.imageModel});
  @override
  Widget build(context) {
    print('...............................ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo${imageModel.image}');
    if(imageModel==null){
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
    Expanded(
      flex: 5,
          child: SizedBox(
        height:40,
        width:40,
        child: Container(
          child: Image.network(imageModel.image,
          fit: BoxFit.cover,
        )),
      ),
    ),
  ],
);
  }
}