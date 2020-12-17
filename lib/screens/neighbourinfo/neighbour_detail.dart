import 'package:flutter/material.dart';
import 'package:listar_flutter/configs/routes.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/neighbourinfo/neighbourinfo_tab.dart';
import 'package:listar_flutter/screens/product_detail_tab/product_extend_header.dart';
import 'package:listar_flutter/screens/product_detail_tab/product_tab_bar.dart';
import 'package:shimmer/shimmer.dart';


const appBarHeight = 200.0;
const expandedBarHeight = 150.0;
const tabHeight = 50.0;
class NeighbourDetail extends StatefulWidget {
  NeighbourDetail({Key key, this.id = 0}) : super(key: key);

  final num id;
  @override
  _NeighbourDetailState createState() => _NeighbourDetailState();
}

class _NeighbourDetailState extends State<NeighbourDetail> {
   final _scrollController = ScrollController();
   final _tabController = ScrollController();
  ProductDetailTabPageModel _page;
  bool _like = false;
  List<double> _offsetContentOrigin = [];
  int _indexTab = 0;
  
  Widget _buildBanner() {
    if (_page?.product?.image == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      );
    }

    return Image.asset(
      _page?.product?.image,
      fit: BoxFit.cover,
    );
  }
  void _onLike() {
    setState(() {
      _like = !_like;
    });
  }
  void _onReview() {
    Navigator.pushNamed(context, Routes.review);
  }
   void _onChangeTab(int index) {
    if (_offsetContentOrigin.isNotEmpty) {
      _scrollController.animateTo(
        _offsetContentOrigin[index] + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
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
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _buildBanner(),
            ),
          ),
          SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: ProductHeader(
              height: expandedBarHeight,
              productTabPage: _page,
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
              tab: _page?.tab,
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
   Widget _buildTabContent() {
    if (_page?.tab == null) {
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
      children: _page.tab.map((item) {
        return NeighbourInfo(
            item: item, page: _page, onProductDetail: _onProductDetail);
      }).toList(),
    );
  }
  void _onProductDetail(item) {
    Navigator.pushNamed(context, Routes.productDetail, arguments: item.id);
  }
}