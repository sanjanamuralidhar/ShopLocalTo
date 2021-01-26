import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/location/location.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:shimmer/shimmer.dart';

class LocationDetail extends StatefulWidget {
  LocationDetail({Key key, this.id = 0}) : super(key: key);

  final num id;

  @override
  _LocationDetailState createState() {
    return _LocationDetailState();
  }
}

class _LocationDetailState extends State<LocationDetail> {
  bool _like = false;
  PopularModel _popular;
  NearbyModel _nearly;
  // List<RelatedModel> _related;
  List<NearbyModel> _nearby;
  List<ShopModel> _shops;
  // bool _showHour = false;
  // ProductDetailPageModel _detailPage;

  @override
  void initState() {
    _loadDetail();
    _loadNearby();
    _loadVendor();
    // _loadFeature();
    // _loadRelated();
    super.initState();
  }

  Future<void> _loadDetail() async {
    final dynamic result = await Api.getLocationDataDetail(id: widget.id);
    print('.......................................0000000000...................................................${widget.id}');
    setState(() {
        _popular = result;
      });
      print('.....................................0000000000.....................................................${_popular.name}');
  }

   Future<void> _loadNearby() async {
    final List<NearbyModel> result = await Api.getLocationNearbyDetail(id: widget.id);
    print('..............................................222222222............................................${widget.id}');
    setState(() {
        _nearby = result;
      });
    print('..............................................222222222............................................${_nearby.length}');  
    return _nearby;
  }

   Future<void> _loadVendor() async {
    final List<ShopModel> result = await Api.getLocationShopDetail(id: widget.id);
    print('..............................................222222222............................................${widget.id}');
    setState(() {
        _shops = result;
      });
    print('..............................................222222222............................................${_nearby.length}');  
    return _nearby;
  }


  ///On navigate map
  void _onLocation() {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Location(location: _popular.location,)),
            );
    // Navigator.pushNamed(
    //   context,
    //   Routes.location,
    //   arguments:_popular.location,
    // );
  }
  void _onNearbyDetail(NearbyModel item) {
    // String route = item.type == RelatedType.place
    //     ? Routes.locationDetail
    //     : Routes.locationDetailTab;
    Navigator.pushNamed(context, Routes.locationDetailTab, arguments: item.id);
  }
    void _onShopDetail(ShopModel item) {
    // String route = item.type == RelatedType.place
    //     ? Routes.locationDetail
    //     : Routes.locationDetailTab;
    Navigator.pushNamed(context, Routes.productDetail, arguments: item.id);
  }

  ///On navigate review
  // void _onReview() {
  //   Navigator.pushNamed(context, Routes.review);
  // }

  // ///On like product
  void _onLike() {
    setState(() {
      _like = !_like;
    });
  }
   Widget _buildBanner() {
   if (_popular == null) {
 return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      );
    }
    return Image.network(
      // 'http://dev.shoplocalto.ca/images/neighbourhoods/Eo4lpejKzoXO4UKdu02KUmhdQhVhn9.png',
      _popular.picture,
      fit: BoxFit.cover,
    );
  }
// Widget _buildBanner() {
//     return ListView(
//   scrollDirection: Axis.horizontal, // <-- Like so
//   children: <Widget>[
//     Container(
//       child: Image.asset(Images.Trip1,
//       // "assets/images/trip.png",
//       fit: BoxFit.cover,
//     )),
//     Container(
//       child: Image.asset(Images.Trip2,
//       // "assets/images/trip1.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip3,
//       // "assets/images/trip2.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip4,
//       // "assets/images/trip3.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip5,
//       // "assets/images/trip4.png",
//       fit: BoxFit.cover,
//     )
//     ),
//   ],
// );
    
//   }
  ///Build info

  // ///Build list feature
  // Widget _buildFeature() {
  //   if ( _nearby == null) {
  //     return Container();
  //   }

  //   return Padding(
  //     padding: EdgeInsets.only(top: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 20,
  //             right: 20,
  //             bottom: 15,
  //           ),
  //           child: Text(
  //             Translate.of(context).translate('featured'),
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
  //               final item = _nearby[index];
  //               return Container(
  //                 width: MediaQuery.of(context).size.width / 2,
  //                 padding: EdgeInsets.only(right: 15),
  //                 child: AppPopularItem(
  //                   onPressNearby: _onNearbyDetail,
  //                   nearbyModel: item,
  //                   type: PopularViewType.gird,
  //                 ),
  //               );
  //             },
  //             itemCount: _nearby.length,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
Widget _buildInfo() {
    if (_popular == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                height: 10,
                width: 150,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Container(
                        height: 20,
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    color: Colors.white,
                  ),
                ],
              ),
             
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, width: 50, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _popular.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: _onLocation,
              ),
             
            ],
          ),
         
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          // Text(
          //   _popular.description,
          //   style: Theme.of(context).textTheme.bodyText1.copyWith(height: 1.3),
          // ),
        ],
      ),
    );
  }
  ///Build list related
  Widget _buildNearBy() {
    // print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb${_nearby.length}');
    if (_nearby == null) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              Translate.of(context).translate('NearBy'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: _nearby.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: AppPopularItem(
                  onPressNearby: _onNearbyDetail,
                  nearbyModel: item,
                  type: PopularViewType.small,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildVendorList() {
    if (_shops == null) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('featured'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) {
                final item = _shops[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppPopularItem(
                    onPressShops: _onShopDetail,
                    shopModel: item,
                    type: PopularViewType.gird,
                  ),
                );
              },
              itemCount: _shops.length,
            ),
          )
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            actions: <Widget>[
              
              // IconButton(
              //   icon: Icon(Icons.photo_library),
              //   // onPressed: _onPhotoPreview,
              // )
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _buildBanner(),
            ),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  children: <Widget>[
                    _buildInfo(),
                    _buildVendorList(),
                    _buildNearBy()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}
