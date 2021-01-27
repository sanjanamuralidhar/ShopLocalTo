import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/home/home_category_list.dart';
import 'package:listar_flutter/screens/home/home_category_page.dart';
import 'package:listar_flutter/screens/home/home_sliver_app_bar.dart';
import 'package:listar_flutter/screens/signup/signup.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/screens/list_product/list_product.dart';

class Home extends StatefulWidget {
  Home({Key key, this.id}) : super(key: key);
  final num id;

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  HomePageModel _homePage;
  PopularPageModel _popularPageModel;
  //  bool _tryAgain = false;
  // List<MyLocation> _locations = [];
  // List<ShopModel> _shops = [];
  // List<CategoryModel2> _categoryList = [];
  // List<ShopModel> _categoryshops = [];
  bool _tryAgain = false;
  List<Address> addresses;
  List<Address> address;
  Address first;
  Address old;
  Position _currentPosition;
  Position _lastKnown;
  final Geolocator geolocator = Geolocator();
  CategoryModel2 _categoryModel2;
// ProductListPageModel _productListPageModel;
List<ListModel> _list;
String title;
int id;
  @override
  void initState() {
    //  _checkLocation();
    _loadData();
    // _loadPopular();
    // _loadShops();
    // _loadCategoryList();
    // _loadSearchResults();
    super.initState();
  }
   _checkLocation() async {
    // the method below returns a Future
    var connectivityResult = await (new Connectivity().checkConnectivity());
    bool connectedToWifi = (connectivityResult == ConnectivityResult.wifi);
    if (!connectedToWifi) {
      _showAlert(context);
    }
    if (_tryAgain != !connectedToWifi) {
      setState(() => _tryAgain = !connectedToWifi);
    }
  }

  // ///Fetch API
  Future<void> _loadData() async {
    final dynamic result = await Api.getHome();
      setState(() {
        _homePage = result;
      });
  }

  // Future<void> _loadPopular() async {
  //   final List<MyLocation> result = await Api.getPopular();
  //   setState(() {
  //     _locations = result;
  //   });
  // }

  // Future<void> _loadShops() async {
  //   final List<ShopModel> result = await Api.getShops();
  //   setState(() {
  //     _shops = result;
  //   });
  //   // print('ShopModel list ************:${_shops.length}');
  // }
  //  Future<void> _loadSearchResults() async {
  //   final List<ShopModel> result = await Api.getSearchResult(id:widget.id);
  //   setState(() {
  //     _categoryshops = result;
  //   });
  //   // print('ShopModel list ************:${_shops.length}');
  // }


  //  Future<void> _loadCategoryList() async {
  //   final List<CategoryModel2> result = await Api.getCategoryList();
  //   setState(() {
  //     _categoryList = result;
  //   });
  //   // print('category list *************:${_categoryList.length}');
  // }

  ///On navigate product detail
  // /**************************************************** */
  void _onLocationDetail(MyLocation item) {
    // String route = item.type == LocationType.place
    //     ? Routes.locationDetail
    //     : Routes.locationDetail;
    Navigator.pushNamed(context, Routes.locationDetail, arguments: item.id);
  }
  // ******************************************************************/

void _onShopDetail(ShopModel item) {
    // ignore: unrelated_type_equality_checks
    String route = item.type == ShopType.place
        ? Routes.productDetail
        :Routes.productDetailTab;
    Navigator.pushNamed(context, route, arguments: item.id);
  }
  // /Build category UI
  // Widget _buildCategory() {
  //   if (_homePage?.category == null) {
  //     return Wrap(
  //       runSpacing: 10,
  //       alignment: WrapAlignment.center,
  //       children: List.generate(8, (index) => index).map(
  //         (item) {
  //           return HomeCategoryItem();
  //         },
  //       ).toList(),
  //     );
  //   }

  //   List<CategoryModel> listBuild = _homePage.category;

  //   final more = CategoryModel.fromJson({
  //     "id": 9,
  //     "title": Translate.of(context).translate("more"),
  //     "icon": "http://dev.shoplocalto.ca/images/category/qVXlZTwRQDl3c0S.png",
  //     "color": "#ff8a65",
  //     "type": "more"
  //   });

  //   if (_homePage.category.length > 7) {
  //     listBuild = _homePage.category.take(7).toList();
  //     listBuild.add(more);
  //   }

  //   return Wrap(
  //     runSpacing: 10,
  //     alignment: WrapAlignment.center,
  //     children: listBuild.map(
  //       (item) {
  //         return HomeCategoryItem(
  //           item: item,
  //           onPressed: (item) {
  //             _onTapService(item);
  //           },
  //         );
  //       },
  //     ).toList(),
  //   );
  // }
  // ontaps for catagory@sanjana
   void _onTapService(CategoryModel2 item) {
    switch (item.type) {
      case CategoryType2.more:
        _onOpenMore();
        break;

      default:
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListProduct(id: item.id,title: item.title,)),
            );
        // Navigator.pushNamed(context, Routes.listProduct, arguments: item.id);
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
          category: _homePage == null?[]:_homePage.category,
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
//Build category @SANJANA
   Widget _buildCategoryItem() {
    //  print('category list ///////////////////:${_categoryList.length}');
    List<CategoryModel2> category2 = _homePage == null?[]:_homePage.category;
    if (category2 == null) {
      return Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(8, (index) => index).map(
          (item) {
            return HomeCategoryPage(
            );
          },
        ).toList(),
      );
    }

    List<CategoryModel2> listBuild = _homePage == null?[]:_homePage.category;
    final more = CategoryModel2.fromJson({
      "id": 9,
      "title": Translate.of(context).translate("more"),
      "icon": "http://dev.shoplocalto.ca/images/category/qVXlZTwRQDl3c0S.png",
      "color": "#DD0000",
      "type": "more"
    });

    if (category2.length > 7) {
      listBuild = category2.take(7).toList();
      listBuild.add(more);
    }

    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: listBuild.map(
        (item) {
          return HomeCategoryPage(
            categoryModel2: item,
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
    // print(_locations.toString());
    List<MyLocation> poplocation = _homePage==null?[]:_homePage.locations;
    if (poplocation == null) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          final item = poplocation[index];
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppProductItem(
              mylocation: item,
              type: ProductViewType.cardLarge,
              onPressLocation: _onLocationDetail,
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
        final item = poplocation[index];
        return Padding(
          padding: EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 135,
            height: 160,
            // *************************************************
            child: AppProductItem(
              mylocation: item,
              type: ProductViewType.cardLarge,
              onPressLocation: _onLocationDetail,//from here go to _onlocation detail
            ),
            // *****************************************************
          ),
        );
      },
      itemCount: poplocation.length,
    );
  }

  //Build shops @SANJANA
 Widget _buildShopList() {
   List<ShopModel> shopss = _homePage == null? []: _homePage.shops;
    if (shopss == null) {
      return Column(
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: AppProductItem(type: ProductViewType.cardSmall),
            );
          },
        ).toList(),
      );
    }

    return Column(
      children: shopss.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: AppProductItem(
            onPressshop: _onShopDetail,
            shopModel: item,
            type: ProductViewType.cardSmall,
          ),
        );
      }).toList(),
    );
  }

  ///Build popular UI
  // Widget _buildPopular() {
  //   print('popular location api call _popularPageModel2:$_popularPageModel');
  //   if (_homePage?.popular == null) {
  //     return ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsets.only(left: 15),
  //           child: AppProductItem(
  //             type: ProductViewType.cardLarge,
  //           ),
  //         );
  //       },
  //       itemCount: List.generate(8, (index) => index).length,
  //     );
  //   }

  //   return ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
  //     itemBuilder: (context, index) {
  //       final item = _homePage.popular[index];
  //       return Padding(
  //         padding: EdgeInsets.only(left: 15),
  //         child: SizedBox(
  //           width: 135,
  //           height: 160,
  //           child: AppProductItem(
  //             item: item,
  //             type: ProductViewType.cardLarge,
  //             onPressed: _onProductDetail,
  //           ),
  //         ),
  //       );
  //     },
  //     itemCount: _homePage.popular.length,
  //   );
  // }


  ///Build list recent
  // Widget _buildList() {
  //   if (_homePage?.list == null) {
  //     return Column(
  //       children: List.generate(8, (index) => index).map(
  //         (item) {
  //           return Padding(
  //             padding: EdgeInsets.only(bottom: 15),
  //             child: AppProductItem(type: ProductViewType.small),
  //           );
  //         },
  //       ).toList(),
  //     );
  //   }

  //   return Column(
  //     children: _homePage.list.map((item) {
  //       return Padding(
  //         padding: EdgeInsets.only(bottom: 15),
  //         child: AppProductItem(
  //           onPressed: _onProductDetail,
  //           item: item,
  //           type: ProductViewType.small,
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    
    // print('popular locatiugbuiiiiibj buiob:$_popularPageModel');
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: AppBarHomeSliver(
              expandedHeight: 250,
              banners:_homePage == null ? []: _homePage.banners,
              // shopModel:_homePage.shops,
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
                      child: 
                      _buildCategoryItem(),
                      // _buildCategory(),

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
                      child:
                       _buildPopLocation(),
                      //  _buildPopular(),
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
                      child: 
                      _buildShopList(),
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
  
  Future<void> _showAlert(BuildContext context) async {
     _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     _lastKnown = await Geolocator.getLastKnownPosition();
     final coordinates = new Coordinates(_currentPosition.latitude,_currentPosition.longitude);
     final coordinate = new Coordinates(_lastKnown.latitude,_lastKnown.longitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    address = await Geocoder.local.findAddressesFromCoordinates(coordinate);
    setState(() {
      first = addresses.first;
      old = address.first;
    });
    //  print("::::::::::::0000000000:::::::::: ${first.thoroughfare}");
      // print("::::::::::::0000000000:::::::::: ${old.thoroughfare}");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Are you in  ${old.thoroughfare}'),
                    Text(
                        'Would you like to change the location to "${first.thoroughfare}" or continue with  ${old.thoroughfare}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Continue',
                      style: TextStyle(color: Colors.blue[700], fontSize: 17)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Cancel',
                      style: TextStyle(color: Colors.blue[700], fontSize: 17)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          );
  }
}
