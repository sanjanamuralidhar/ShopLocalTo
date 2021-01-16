import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class TabContent extends StatelessWidget {
  final TabModel item;
  final ProductModel page;
  final Function(NearlyModel) onNearlyModelDetail;
  final ProductModel productModel;
  final Function(ProductModel) onProductDetail;

  TabContent({
    Key key,
    this.item,
    this.page,
    this.onProductDetail, this.productModel, this.onNearlyModelDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (item.key) {
      
      case 'information':
      // print('+++++++++++++++++++++${item.key}+++++++++++');
      // print('++++++productmodel+++++++++++++++${page.address}+++++++++++');
      // print('++++++feature+++++++++++++++${page.feature.length}+++++++++++');
      // print('++++related+++++++++++++++++${page.related.length}+++++++++++');
        return Container(
          key: item.keyContentItem,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    Translate.of(context).translate(item.title),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).buttonColor,
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('address'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              page.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                InkWell(
                  onTap: () {launch("tel:${page.phone}");},
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).buttonColor,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('phone'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              
                              page.phone,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                InkWell(
                  onTap: () {launch("mailto:${page.email}");},
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).buttonColor),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('email'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              page.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                InkWell(
                  onTap: () {launch('${page.website}');},
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).buttonColor),
                        child: Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('website'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              page.website,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).buttonColor,
                            ),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  Translate.of(context).translate('open_time'),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  page.hour,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: page.hourDetail.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            Translate.of(context).translate(item.title),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            item.time == 'day_off'
                                ? Translate.of(context).translate('day_off')
                                : item.time,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(
                  page.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.3),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Translate.of(context).translate('date_established'),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text(
                              page.date,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            Translate.of(context).translate('price_range'),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text(
                              page.priceRange,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case 'socialmedia':
        return Container(
          key: item.keyContentItem,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  child: Text(
                    Translate.of(context).translate('Social Media'),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                //   child: Wrap(spacing: 10, runSpacing: 10, 
                //   children: page.service.map((item) {
                //     return IntrinsicWidth(
                //         child: SizedBox(
                //       height: 35,
                //       width: 35,
                //       child: Material(
                //           type: MaterialType
                //               .transparency,
                //           child: Ink(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               color: Theme.of(context).buttonColor,
                //             ),
                //             child: InkWell(
                //                 onTap: () {},
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8),
                //                   child: Image.asset(item.image),
                //                 )
                //                 ),
                //           )),
                //     ));
                //      }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        );

      case 'facilities':
        return Container(
          key: item.keyContentItem,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  child: Text(
                    Translate.of(context).translate('facilities'),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: page.service.map((item) {
                      return IntrinsicWidth(
                        child: AppTag(
                          item.title,
                          type: TagType.chip,
                          icon: Icon(
                            UtilIcon.getIconData(item.icon),
                            size: 12,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );

      // case 'related':
      //   return Container(
      //     key: item.keyContentItem,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Padding(
      //           padding: EdgeInsets.only(
      //             left: 20,
      //             right: 20,
      //             bottom: 15,
      //             top: 15,
      //           ),
      //           child: Text(
      //             Translate.of(context).translate('Related'),
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .headline6
      //                 .copyWith(fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //         Container(
      //           height: 220,
      //           child: ListView.builder(
      //             scrollDirection: Axis.horizontal,
      //             padding: EdgeInsets.only(left: 20),
      //             itemBuilder: (context, index) {
      //               final item = page.related[index];
      //               return Container(
      //                 width: MediaQuery.of(context).size.width / 2,
      //                 padding: EdgeInsets.only(right: 15),
      //                 child: AppProductItem(
      //                   item: item,
      //                   onPressed: onProductDetail,
      //                   type: ProductViewType.gird,
      //                 ),
      //               );
      //             },
      //             itemCount: page.related.length,
      //           ),
      //         ),
      //         Container(
      //           height: 15,
      //           margin: EdgeInsets.only(left: 20, right: 20),
      //           decoration: BoxDecoration(
      //             border: Border(
      //               bottom: BorderSide(
      //                 color: Theme.of(context).dividerColor,
      //               ),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   );

      case 'nearly':
        return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 15,top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('nearly'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final item = page.nearly[index];
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPress: onNearlyModelDetail,
                        nearlyModel: item,
                        type: ProductViewType.list,
                      ),
                    );
                  },
                  itemCount: page.nearly.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );

      // case 'ordinary':
      //   return Container(
      //     key: item.keyContentItem,
      //     padding: EdgeInsets.only(left: 20, right: 20),
      //     child: Container(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Padding(
      //             padding: EdgeInsets.only(top: 15, bottom: 15),
      //             child: Text(
      //               Translate.of(context).translate('Ordinary Listing'),
      //               style: Theme.of(context)
      //                   .textTheme
      //                   .headline6
      //                   .copyWith(fontWeight: FontWeight.w600),
      //             ),
      //           ),
      //           Column(
      //             children: page.related.map((item) {
      //               return Padding(
      //                 padding: EdgeInsets.only(bottom: 15),
      //                 child: AppProductItem(
      //                   onPressed: onProductDetail,
      //                   item: item,
      //                   type: ProductViewType.small,
      //                 ),
      //               );
      //             }).toList(),
      //           )
      //         ],
      //       ),
      //     ),
      //   );

      default:
        return Container(
          key: item.keyContentItem,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  Translate.of(context).translate(item.title),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 200,
                child: Placeholder(),
              )
            ],
          ),
        );
    }
  }
}
