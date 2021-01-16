import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:shimmer/shimmer.dart';

import 'product_banner_photo.dart';
import 'product_extend_header.dart';
import 'product_tab_bar.dart';
import 'product_tab_content.dart';

const appBarHeight = 200.0;
const expandedBarHeight = 150.0;
const tabHeight = 50.0;

class ProductDetailTab extends StatefulWidget {
  ProductDetailTab({Key key, this.id = 0}) : super(key: key);

  final num id;

  @override
  _ProductDetailTabState createState() {
    return _ProductDetailTabState();
  }
}

class _ProductDetailTabState extends State<ProductDetailTab> {
  final _tabController = ScrollController();
  final _scrollController = ScrollController();

  bool _like = false;
  List<double> _offsetContentOrigin = [];
  int _indexTab = 0;
  ProductModel _product;
  ProductDetailTabPageModel _page;
  List<TabModel> _tabModel;
  UserModel _userModel;
    List<ImageModel> _images = [];

  @override
  void initState() {
    // _loadPhoto();
    _loadData();
    _loadDetail();
    _scrollController.addListener(_scrollListener);
    // _loadTab();
    
    // _loadUser();
    
    super.initState();
  }

  // /Fetch API
  Future<void> _loadData() async {
    final List<TabModel> result = await Api.getTabtabDetail(
      id: widget.id,
    );
      setState(() {
        _tabModel = result;
      });
      // print('TabModel is .................${_tabModel.length}');
      Timer(Duration(milliseconds: 150), () {
        _setOriginOffset();
      });
  }

  // sanjana
  Future<void> _loadDetail() async {
    final ProductModel result = await Api.getShopDataDetail(
      id: widget.id,
    );
    // print('id is .................${widget.id}');
      setState(() {
        _product = result;
      });
      // print('ProductModel is .................${_product.author.name}');
      //  print('FeatureModel is .................${_product.feature.length}');
      //  print('TabModel is .................${_product.tabs.length}');
      Timer(Duration(milliseconds: 150), () {
        _setOriginOffset();
      });
  }

  // sanjana
Future<void> _loadUser() async {
    final UserModel result = await Api.getUserDetail(
      id: widget.id,
    );
    // print('id is .................${widget.id}');
      setState(() {
        _userModel = result;
      });
      // print('usermodel  is .................${_userModel.name}');
      Timer(Duration(milliseconds: 150), () {
        _setOriginOffset();
      });
  }

  Future<void> _loadPhoto() async {
    final List<ImageModel> result = await Api.getUserPhoto();
    setState(() {
      _images = result;
    });
    // print('ImageModel list ************:${_images.length}');
  }


  ///ScrollListenerEvent
  void _scrollListener() {
    if (_tabModel != null) {
      int activeTab = 0;
      double offsetTab;
      double widthDevice = MediaQuery.of(context).size.width;
      double itemSize = widthDevice / 3;
      double offsetStart = widthDevice / 2 - itemSize / 2;

      int indexCheck = _offsetContentOrigin.indexWhere((item) {
        return item - 1 > _scrollController.offset;
      });
      if (indexCheck == -1) {
        activeTab = _offsetContentOrigin.length - 1;
        offsetTab = offsetStart + itemSize * (activeTab - 3);
      } else if (indexCheck > 0) {
        activeTab = indexCheck - 1 > 0 ? indexCheck - 1 : 0;
        offsetTab =
            activeTab > 1 ? offsetStart + itemSize * (activeTab - 2) : 0;
      }

      if (activeTab != _indexTab) {
        setState(() {
          _indexTab = activeTab;
        });
      }
      if (offsetTab != null) {
        _tabController.jumpTo(offsetTab);
      }
    }
  }

  ///Set Origin Offset default when render success
  void _setOriginOffset() {
    if (_tabModel != null && _offsetContentOrigin.isEmpty) {
      setState(() {
        _offsetContentOrigin = _tabModel.map((item) {
          final RenderBox box =
              item.keyContentItem.currentContext.findRenderObject();
          final position = box.localToGlobal(Offset.zero);
          return position.dy +
              _scrollController.offset -
              tabHeight -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top;
        }).toList();
      });
    }
  }

  ///On Change tab jumpTo offset
  ///Scroll controller will handle setState active tab
  void _onChangeTab(int index) {
    if (_offsetContentOrigin.isNotEmpty) {
      _scrollController.animateTo(
        _offsetContentOrigin[index] + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  ///On navigate gallery
  void _onPhotoPreview() {
    Navigator.pushNamed(
      context,
      Routes.gallery,
      arguments: _page?.product?.photo,
    );
  }

  ///On navigate map
  void _onLocation() {
    Navigator.pushNamed(
      context,
      Routes.location,
      arguments: _page?.product?.location,
    );
  }

  ///On navigate review
  void _onReview() {
    Navigator.pushNamed(context, Routes.review);
  }

  ///On navigate product detail
  void _onProductDetail(item) {
    Navigator.pushNamed(context, Routes.productDetail, arguments: item.id);
  }

  ///On like product
  void _onLike() {
    setState(() {
      _like = !_like;
    });
  }

  // /Build banner UI
  Widget _buildBanner() {
   if (_images == null) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          final item = _images[index];
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: SliverPersistentHeader(
              pinned: true,
            floating: false,
            delegate:ProductBannerHeader(
             height: expandedBarHeight,
             productModel:item
            ),
            )
          );
        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }
    return Image.asset(
      Images.Trip4,
      fit: BoxFit.cover,
    );
  }
    // if (_page?.product?.image == null) {
    //   return Shimmer.fromColors(
    //     baseColor: Theme.of(context).hoverColor,
    //     highlightColor: Theme.of(context).highlightColor,
    //     enabled: true,
    //     child: Container(
    //       color: Colors.white,
    //     ),
    //   );
    // }

    // return Image.asset(
    //   _page?.product?.image,
    //   fit: BoxFit.cover,
    // );
  // }
  
//   Widget _buildBanner() {
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

  ///Build Tab Content UI
  Widget _buildTabContent() {
    // print('(((((((((((((((((((((((((((${_tabModel.length})))))))))))))))))))))))))');
    if (_tabModel == null) {
      return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).hoverColor,
          highlightColor: Theme.of(context).highlightColor,
          enabled: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(8, (index) => index).map(
              (item) {
                return Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Container(height: 32, color: Colors.white),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _tabModel.map((item) {
        return TabContent(
            item: item, page: _product, onNearlyModelDetail: _onProductDetail);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: appBarHeight,
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: _onLocation,
              ),
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
          SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: ProductHeader(
              productModel:_product,
              // userModel: _userModel,
              height: expandedBarHeight,
              // productTabPage: _page,
              like: _like,
              onPressLike: _onLike,
              onPressReview: _onReview,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: ProductTabBar(
              height: tabHeight,
              tabController: _tabController,
              onIndexChanged: _onChangeTab,
              indexTab: _indexTab,
              tab: _tabModel,
            ),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              child: _buildTabContent(),
            ),
          )
        ],
      ),
    );
  }
}
