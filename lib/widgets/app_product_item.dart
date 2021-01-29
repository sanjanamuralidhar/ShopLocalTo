import 'package:flutter/material.dart';
import 'package:listar_flutter/configs/theme.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:shimmer/shimmer.dart';


enum ProductViewType { small, gird, list, block, cardLarge, cardSmall }

class AppProductItem extends StatelessWidget {
  final ProductModel item;
  final ShopModel shopModel;//ProductViewType.cardSmall
  final MyLocation mylocation;//productViewType:cardLarge
  final NearlyModel nearlyModel;//productViewType:list
  final FeatureModel featureModel;//productViewType:grid
  final RelatedModel relatedModel;//productViewType:small
  final ShopModel wishlistModel;//productViewType:block
  final ProductViewType type;
  final LocationViewType locationtype;
  final Function(NearlyModel) onPress;
  final Function(ProductModel) onPressed;
  final Function(FeatureModel) onPressFeature;
  final Function(RelatedModel) onPressRelated;
  final Function(MyLocation) onPressLocation;
final Function(ShopModel) onPressshop;
  const AppProductItem({Key key, this.item, this.type, this.onPressed, this.nearlyModel, this.onPress, this.featureModel, this.relatedModel, this.onPressFeature, this.onPressRelated, this.mylocation, this.locationtype, this.onPressLocation, this.onPressshop, this.shopModel, this.wishlistModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('++++++Appproductmodel+++++++++++++++${item.address}+++++++++++');
      // print('++++++Appfeature+++++++++++++++${item.feature.length}+++++++++++');
      // print('++++Apprelated+++++++++++++++++${nearlyModel.address}+++++++++++');
    switch (type) {

      // ///Mode View Small
      case ProductViewType.small:
        if (relatedModel == null) {
          return Shimmer.fromColors(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 180,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            onPressRelated(relatedModel);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Image.network(
              //     item.image,
              //     width: 80,
              //     height: 80,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      relatedModel.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      relatedModel.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding: EdgeInsets.only(top: 10)),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     AppTag(
                    //       "${relatedModel.rate}",
                    //       type: TagType.rateSmall,
                    //     ),
                    //     Padding(padding: EdgeInsets.only(left: 5)),
                    //     StarRating(
                    //       rating: relatedModel.rate,
                    //       size: 14,
                    //       color: AppTheme.yellowColor,
                    //       borderColor: AppTheme.yellowColor,
                    //     )
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        );
    
      // /Mode View Gird
      case ProductViewType.gird:
        if (featureModel == null) {
          return Shimmer.fromColors(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Container(
                    height: 10,
                    width: 80,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Container(
                    height: 10,
                    width: 100,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    height: 10,
                    width: 80,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }
 print(featureModel);
        return FlatButton(
         
          onPressed: () {
            onPressFeature(featureModel);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    image: DecorationImage(
                      // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: NetworkImage(featureModel.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          featureModel.status != null
                              ? Padding(
                                  padding: EdgeInsets.all(5),
                                  child: AppTag(
                                    featureModel.status,
                                    type: TagType.status,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // Padding(
                          //   padding: EdgeInsets.all(5),
                          //   child: Icon(
                          //     nearlyModel.favorite
                          //         ? Icons.favorite
                          //         : Icons.favorite_border,
                          //     color: Colors.white,
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 3)),
                Text(
                  featureModel.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  featureModel.title,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                // Padding(padding: EdgeInsets.only(top: 10)),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     AppTag(
                //       "${featureModel.rate}",
                //       type: TagType.rateSmall,
                //     ),
                //     Padding(padding: EdgeInsets.only(left: 5)),
                //     StarRating(
                //       rating: featureModel.rate,
                //       size: 14,
                //       color: AppTheme.yellowColor,
                //       borderColor: AppTheme.yellowColor,
                //     )
                //   ],
                // ),
                Padding(padding: EdgeInsets.only(top: 10)),
                // Text(
                //   featureModel.address,
                //   maxLines: 1,
                //   style: Theme.of(context).textTheme.caption,
                // ),
              ],
            ),
          ),
        );
    
      // /Mode View List
      case ProductViewType.list:
        if (nearlyModel == null) {
          return Shimmer.fromColors(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          height: 20,
                          width: 80,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            // onPressed(item);
            onPress(nearlyModel);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(nearlyModel.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  nearlyModel.status != null
                        ? Padding(
                            padding: EdgeInsets.all(5),
                            child: AppTag(
                              nearlyModel.status,
                              type: TagType.status,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nearlyModel.subtitle,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(
                        nearlyModel.title,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      // Padding(padding: EdgeInsets.only(top: 5)),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     AppTag(
                      //       "${nearlyModel.rate}",
                      //       type: TagType.rateSmall,
                      //     ),
                      //     Padding(padding: EdgeInsets.only(left: 5)),
                      //     StarRating(
                      //       rating: nearlyModel.rate,
                      //       size: 14,
                      //       color: AppTheme.yellowColor,
                      //       borderColor: AppTheme.yellowColor,
                      //     )
                      //   ],
                      // ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          // Expanded(
                          //   child: Padding(
                          //     padding: EdgeInsets.only(left: 3, right: 3),
                          //     child: Text(nearlyModel.address,
                          //         maxLines: 1,
                          //         style: Theme.of(context).textTheme.caption),
                          //   ),
                          // )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 3, right: 3),
                              child: Text(nearlyModel.phone,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.caption),
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Icon(
                      //       nearlyModel.favorite
                      //           ? Icons.favorite
                      //           : Icons.favorite_border,
                      //       color: Theme.of(context).primaryColor,
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
// 888888888****************************Wishliststart***************************************
      // ///Mode View Block
      case ProductViewType.block:
        if (item == null) {
          return Shimmer.fromColors(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 10,
                        width: 200,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }
        return FlatButton(
          onPressed: () {
            onPressed(item);
          },
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          item.status != null
                              ? AppTag(
                                  item.status,
                                  type: TagType.status,
                                )
                              : Container(),
                          // Icon(
                          //   nearlyModel.favorite
                          //       ? Icons.favorite
                          //       : Icons.favorite_border,
                          //   color: Colors.white,
                          // )
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: <Widget>[
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Row(
                    //             children: <Widget>[
                    //               AppTag(
                    //                 "${item.rate}",
                    //                 type: TagType.rateSmall,
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.only(left: 5),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     // Padding(
                    //                     //   padding: EdgeInsets.only(left: 3),
                    //                     //   child: Text(
                    //                     //     wishlistModel.rateText,
                    //                     //     style: Theme.of(context)
                    //                     //         .textTheme
                    //                     //         .caption
                    //                     //         .copyWith(
                    //                     //           color: Colors.white,
                    //                     //           fontWeight: FontWeight.w600,
                    //                     //         ),
                    //                     //   ),
                    //                     // ),
                    //                     StarRating(
                    //                       rating: item.rate,
                    //                       size: 14,
                    //                       color: AppTheme.yellowColor,
                    //                       borderColor: AppTheme.yellowColor,
                    //                     )
                    //                   ],
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //           // Padding(
                    //           //   padding: EdgeInsets.only(top: 3),
                    //           //   child: Text(
                    //           //     "${wishlistModel.numRate} reviews",
                    //           //     style: Theme.of(context)
                    //           //         .textTheme
                    //           //         .caption
                    //           //         .copyWith(
                    //           //           color: Colors.white,
                    //           //           fontWeight: FontWeight.w600,
                    //           //         ),
                    //           //   ),
                    //           // )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      item.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                        // Expanded(
                        //   child: Padding(
                        //     padding: EdgeInsets.only(left: 3, right: 3),
                        //     child: Text(
                        //       nearlyModel.address,
                        //       maxLines: 1,
                        //       style: Theme.of(context).textTheme.caption,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Text(
                              item.phone,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
   // ***************************************WishListEnd*********************************************
      ///Case View Card large
      case ProductViewType.cardLarge:
        if (mylocation == null) {
          return SizedBox(
            width: 135,
            height: 160,
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).hoverColor,
              highlightColor: Theme.of(context).highlightColor,
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        }

        return SizedBox(
          width: 135,
          height: 160,
          child: GestureDetector(
            onTap: () {
              // **************************
              onPressLocation(mylocation);//from here go to home.dart
              // *************************
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
                    image: NetworkImage(mylocation.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        mylocation.title,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

      ///Case View Card small
      case ProductViewType.cardSmall:
      if (shopModel == null) {
          return Shimmer.fromColors(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 180,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            onPressshop(shopModel);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  shopModel.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5, 
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      shopModel.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      shopModel.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding: EdgeInsets.only(top: 10)),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     AppTag(
                    //       "${shopModel.id}",
                    //       type: TagType.rateSmall,
                    //     ),
                    //     Padding(padding: EdgeInsets.only(left: 5)),
                    //     StarRating(
                    //       rating: shopModel.rate,
                    //       size: 14,
                    //       color: AppTheme.yellowColor,
                    //       borderColor: AppTheme.yellowColor,
                    //     )
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        );
        // if (shopModel == null) {
        //   return SizedBox(
        //     width: 100,
        //     height: 100,
        //     child: Shimmer.fromColors(
        //       baseColor: Theme.of(context).hoverColor,
        //       highlightColor: Theme.of(context).highlightColor,
        //       enabled: true,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //       ),
        //     ),
        //   );
        // }

        // return SizedBox(
        //   width: 100,
        //   height: 100,
        //   child: GestureDetector(
        //     onTap: () {
        //       onPressshop(shopModel);
        //     },
        //     child: Card(
        //       elevation: 2,
        //       margin: EdgeInsets.all(0),
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       child: Container(
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
        //               image: AssetImage(shopModel.image),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Padding(
        //                 padding: EdgeInsets.all(10),
        //                 child: Text(
        //                   shopModel.title,
        //                   style: Theme.of(context).textTheme.subtitle2.copyWith(
        //         color: Colors.white,
        //         fontWeight: FontWeight.w600,
        //       ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //     ),
        //   ),
        // );

      default:
        return Container(width: 160.0);
    
  }
}
}