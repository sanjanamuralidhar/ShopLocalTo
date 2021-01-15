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
  ProductModel _detail;
  NearlyModel _nearly;
  List<RelatedModel> _related;
  List<FeatureModel> _feature;
  // bool _showHour = false;
  ProductDetailPageModel _detailPage;

  @override
  void initState() {
    // _loadData();
    // _loadNearly();
    _loadDetail();
    _loadFeature();
    _loadRelated();
    super.initState();
  }

  // /Fetch API
  // Future<void> _loadData() async {
  //   final ResultApiModel result = await Api.getProductDetail(id: widget.id);
  //   if (result.success) {
  //     setState(() {
  //       _detailPage = ProductDetailPageModel.fromJson(result.data);
  //       _like = _detailPage?.product?.like;
  //     });
  //   }
  // }
  Future<void> _loadDetail() async {
    final dynamic result = await Api.getShopDataDetail(id: widget.id);
    print('id is .................${widget.id}');
    setState(() {
        _detail = result;
      });
      print('featureModel is .................${_detail.nearly.length}');
  }

   Future<void> _loadFeature() async {
    final List<FeatureModel> result = await Api.getFeatureDetail(id: widget.id);
    print('id is .................${widget.id}');
    setState(() {
        _feature = result;
      });
      print('featureModel is .................${_feature.length}');
  }

   Future<void> _loadRelated() async {
    final List<RelatedModel> result = await Api.getRelatedDetail(id: widget.id);
    print('id is .................${widget.id}');
    setState(() {
        _related = result;
      });
      print('..........................Related is .................${_related.length}');
  }
  // Future<void> _loadNearly() async {
  //   final NearlyModel result = await Api.getNearlyDetail(id: widget.id);
  //   setState(() {
  //       _nearly = result;
  //     });
  // }

  ///On navigate gallery
  // void _onPhotoPreview() {
  //   Navigator.pushNamed(
  //     context,
  //     Routes.gallery,
  //     arguments: _detail.photo,
  //   );
  // }

  ///On navigate map
  void _onLocation() {
    Navigator.pushNamed(
      context,
      Routes.location,
      arguments: _detail.location,
    );
  }
  void _onRelatedDetail(RelatedModel item) {
    String route = item.type == RelatedType.place
        ? Routes.productDetail
        : Routes.productDetailTab;
    Navigator.pushNamed(context, route, arguments: item.id);
  }
  void _onFeatureDetail(FeatureModel item) {
    String route = item.type == FeatureType.place
        ? Routes.productDetail
        : Routes.productDetailTab;
    Navigator.pushNamed(context, route, arguments: item.id);
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

  ///Build list feature
  Widget _buildFeature() {
    if (_feature == null) {
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
                final item = _feature[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppProductItem(
                    onPressFeature: _onFeatureDetail,
                    featureModel: item,
                    type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: _feature.length,
            ),
          )
        ],
      ),
    );
  }

  ///Build list related
  Widget _buildRelated() {
    if (_related == null) {
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
              Translate.of(context).translate('Ordinary Listings'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: _related.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: AppProductItem(
                  onPressRelated: _onRelatedDetail,
                  relatedModel: item,
                  type: ProductViewType.small,
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
                    _buildFeature(),
                    _buildRelated()
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
