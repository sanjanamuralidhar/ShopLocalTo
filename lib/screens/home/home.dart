import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/home/home_category_item.dart';
import 'package:listar_flutter/screens/home/home_category_list.dart';
import 'package:listar_flutter/screens/home/home_sliver_app_bar.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  HomePageModel _homePage;
  PopularPageModel _popularPageModel;
  //  bool _tryAgain = false;
  List<MyLocation> _locations = [];
  List<ShopModel> _shops = [];
  List<CategoryModel2> _categoryList = [];

  @override
  void initState() {
    _loadData();
    _loadPopular();
    _loadShops();
    _loadCategoryList();
    super.initState();
  }
// try dark and white theme

  ///On select category
  void _onTapService(CategoryModel item) {
    switch (item.type) {
      case ProductType.more:
        _onOpenMore();
        break;

      default:
        Navigator.pushNamed(context, Routes.listProduct, arguments: item.title);
        break;
    }
  }

  ///On Open More
  void _onOpenMore() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return HomeCategoryList(
          category: _homePage?.category,
          onOpenList: () async {
            Navigator.pushNamed(context, Routes.category);
          },
          onPress: (item) async {
            Navigator.pop(context);
            await Future.delayed(Duration(milliseconds: 250));
            _onTapService(item);
          },
        );
      },
    );
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getHome();
    if (result.success) {
      setState(() {
        _homePage = HomePageModel.fromJson(result.data);
      });
    }
  }

  Future<void> _loadPopular() async {
    final List<MyLocation> result = await Api.getPopular();
    setState(() {
      _locations = result;
    });
  }

  Future<void> _loadShops() async {
    final List<ShopModel> result = await Api.getShops();
    setState(() {
      _shops = result;
    });
  }

   Future<void> _loadCategoryList() async {
    final List<CategoryModel2> result = await Api.getCategoryList();
    setState(() {
      _categoryList = result;
    });
  }

  ///On navigate product detail
  void _onProductDetail(ProductModel item) {
    String route = item.type == ProductType.place
        ? Routes.productDetail
        : Routes.productDetailTab;
    Navigator.pushNamed(context, route, arguments: item.id);
  }

  // /Build category UI
  Widget _buildCategory() {
    if (_homePage?.category == null) {
      return Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(8, (index) => index).map(
          (item) {
            return HomeCategoryItem();
          },
        ).toList(),
      );
    }

    List<CategoryModel> listBuild = _homePage.category;

    final more = CategoryModel.fromJson({
      "id": 9,
      "title": Translate.of(context).translate("more"),
      "icon": "more_horiz",
      "color": "#ff8a65",
      "type": "more"
    });

    if (_homePage.category.length > 7) {
      listBuild = _homePage.category.take(7).toList();
      listBuild.add(more);
    }

    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: listBuild.map(
        (item) {
          return HomeCategoryItem(
            item: item,
            onPressed: (item) {
              _onTapService(item);
            },
          );
        },
      ).toList(),
    );
  }
//Build category @SANJANA
   Widget _buildCategoryItem() {
    if (_categoryList == null) {
      return Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(8, (index) => index).map(
          (item) {
            return HomeCategoryItem();
          },
        ).toList(),
      );
    }

    List<CategoryModel2> listBuild = _categoryList;
    final more = CategoryModel2.fromJson({
      "id": 9,
      "title": Translate.of(context).translate("more"),
      "icon": "more_horiz",
      "color": "#ff8a65",
      "type": "more"
    });

    if (_categoryList.length > 7) {
      listBuild = _categoryList.take(7).toList();
      listBuild.add(more);
    }

    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: listBuild.map(
        (item) {
          return HomeCategoryItem(
            // item: item,
            onPressed: (item) {
              _onTapService(item);
            },
          );
        },
      ).toList(),
    );
  }

  //Build Popular @SANJANA
  Widget _buildPopLocation() {

    print(_locations.toString());
    if (_locations == null) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          final item = _locations[index];
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppLocation(
              item: item,
              type: LocationViewType.cardLarge,
            ),
          );
        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
      itemBuilder: (context, index) {
        final item = _locations[index];
        return Padding(
          padding: EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 135,
            height: 160,
            child: AppLocation(
              item: item,
              type: LocationViewType.cardLarge,
              onPressed: _onProductDetail,
            ),
          ),
        );
      },
      itemCount: _locations.length,
    );
  }

  //Build shops @SANJANA
   Widget _buildShopList() {
    if (_shops == null) {
      return Column(
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: AppLocation(type: LocationViewType.small),
            );
          },
        ).toList(),
      );
    }

    return Column(
      children: _shops.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: AppLocation(
            onPressed: _onProductDetail,
            // item: item,
            type: LocationViewType.small,
          ),
        );
      }).toList(),
    );
  }

  ///Build popular UI
  Widget _buildPopular(_popularPageModel) {
    print('popular location api call _popularPageModel2:$_popularPageModel');
    if (_homePage?.popular == null) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppProductItem(
              type: ProductViewType.cardLarge,
            ),
          );
        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
      itemBuilder: (context, index) {
        final item = _homePage.popular[index];
        return Padding(
          padding: EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 135,
            height: 160,
            child: AppProductItem(
              item: item,
              type: ProductViewType.cardLarge,
              onPressed: _onProductDetail,
            ),
          ),
        );
      },
      itemCount: _homePage.popular.length,
    );
  }


  ///Build list recent
  Widget _buildList() {
    if (_homePage?.list == null) {
      return Column(
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: AppProductItem(type: ProductViewType.small),
            );
          },
        ).toList(),
      );
    }

    return Column(
      children: _homePage.list.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: AppProductItem(
            onPressed: _onProductDetail,
            item: item,
            type: ProductViewType.small,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('popular locatiugbuiiiiibj buiob:$_popularPageModel');
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: AppBarHomeSliver(
              expandedHeight: 250,
              banners: _homePage?.banner ?? [],
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SafeArea(
                top: false,
                bottom: false,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: _buildCategoryItem(),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Translate.of(context)
                                    .translate('popular_location'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Padding(padding: EdgeInsets.only(top: 3)),
                              Text(
                                Translate.of(context)
                                    .translate('let_find_interesting'),
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 195,
                      child: _buildPopLocation(),
                      //  _buildPopular(_popularPageModel),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Translate.of(context)
                                    .translate('Featured Shops'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                              ),
                              Text(
                                Translate.of(context).translate('what_happen'),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: _buildShopList(),
                      // _buildList()
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
