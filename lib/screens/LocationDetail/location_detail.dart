import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
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
  PopularModel _detail;
  NearbyModel _nearly;
  // List<RelatedModel> _related;
  List<NearbyModel> _nearby;
  // bool _showHour = false;
  // ProductDetailPageModel _detailPage;

  @override
  void initState() {
    _loadDetail();
    _loadNearby();
    // _loadFeature();
    // _loadRelated();
    super.initState();
  }

  Future<void> _loadDetail() async {
    final dynamic result = await Api.getLocationDataDetail(id: widget.id);
    print('..........................................................................................${widget.id}');
    setState(() {
        _detail = result;
      });
      print('..........................................................................................${_detail.nearby.length}');
  }

   Future<void> _loadNearby() async {
    final List<NearbyModel> result = await Api.getLocationNearbyDetail(id: widget.id);
    
    setState(() {
        _nearby = result;
      });
      
  }

  
  

  ///On navigate map
  void _onLocation() {
    Navigator.pushNamed(
      context,
      Routes.location,
      arguments: _detail.latitude,
    );
  }
  void _onNearbyDetail(NearbyModel item) {
    // String route = item.type == RelatedType.place
    //     ? Routes.locationDetail
    //     : Routes.locationDetailTab;
    Navigator.pushNamed(context, Routes.locationDetail, arguments: item.id);
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
    return ListView(
  scrollDirection: Axis.horizontal, // <-- Like so
  children: <Widget>[
    Container(
      child: Image.asset(Images.Trip1,
      // "assets/images/trip.png",
      fit: BoxFit.cover,
    )),
    Container(
      child: Image.asset(Images.Trip2,
      // "assets/images/trip1.png",
      fit: BoxFit.cover,
    )
    ),
    Container(
      child: Image.asset(Images.Trip3,
      // "assets/images/trip2.png",
      fit: BoxFit.cover,
    )
    ),
    Container(
      child: Image.asset(Images.Trip4,
      // "assets/images/trip3.png",
      fit: BoxFit.cover,
    )
    ),
    Container(
      child: Image.asset(Images.Trip5,
      // "assets/images/trip4.png",
      fit: BoxFit.cover,
    )
    ),
  ],
);
    
  }
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

  ///Build list related
  Widget _buildNearBy() {
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
              //   onPressed: _onPhotoPreview,
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
                    // _buildInfo(),
                    // _buildFeature(),
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
