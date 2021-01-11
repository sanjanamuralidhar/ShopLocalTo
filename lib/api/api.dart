import 'dart:async';

import 'package:listar_flutter/api/http_manager.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/utils/utils.dart';

class Api {
  ///URL API
  static const String AUTH_LOGIN = "/jwt-auth/v1/token";
  static const String AUTH_VALIDATE = "/jwt-auth/v1/token/validate";
  static const String GET_SETTING = "/listar/v1/setting/init";
  static const String Post_Login = "http://dev.shoplocalto.ca/api/login";
  static const String Post_Signup = "http://dev.shoplocalto.ca/api/signup";
  static const String Location = "http://dev.shoplocalto.ca/api/locations/featured";

  ///Login api
  static Future<dynamic> login({String email, String password}) async {
    print('this is username :$email');
    print('this is password:$password');
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/login?email='+email+'&password='+password);
    // final result = await httpManager.post(url:Post_Login,data:{'email':username,'password':password});
    // final result = await UtilAsset.loadJson("assets/data/login.json");
    // final result = await httpManager.get(url:"http://dev.shoplocalto.ca/api/test");
    print('this is the response:$result');
    // return ResultApiModel.fromJson(result);
    return result;
    
  }

  //SignUp api
  static Future<dynamic> signup({String username, String email, String password, String phone, String location}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/signup?name='+location+'&password='+password+'&email='+email+'&phone='+phone);
    // final result = await httpManager.post(url:Post_Signup,data:{'email':email,'password':password,'phone':phone,'name':location});
    // final result = await UtilAsset.loadJson("assets/data/signup.json");
    return result;
  }

  // Get sHOP DETAIL @SANJANA
  static Future<dynamic> getDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendor?id='+id.toString());
    return result;
  }

  // sanjana
   static Future<ProductModel> getShopDataDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendor?id='+id.toString());
    print('...........getShopDataDetail()............:$result.runT');
     print('...........getShopDataDetail()............:${result['data']['id']}');
    return ProductModel.fromJson(result['data']);
  }

  // sanjana
   static Future<UserModel> getUserDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendor?id='+id.toString());
    print('...........getUserDetail()............:${result['data']['author']}');
    return UserModel.fromJson(result['data']['author']);
  }

  ///Validate token valid
  static Future<dynamic> validateToken() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/valid_token.json");
    return ResultApiModel.fromJson(result);
  }

  ///Forgot password
  static Future<dynamic> forgotPassword() async {
    return await httpManager.post(url: "");
  }

  ///Get Setting
  static Future<dynamic> getSetting() async {
    final result = await httpManager.get(url: GET_SETTING);
    return ResultApiModel.fromJson(result);
  }

  ///Get Profile Detail
  static Future<dynamic> getProfile() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/profile.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Category
  static Future<dynamic> getCategory() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/category.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get About Us
  static Future<dynamic> getAboutUs() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/about_us.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Home
  static Future<dynamic> getHome() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/home.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Messages
  static Future<dynamic> getMessage() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/message.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Detail Messages
  static Future<dynamic> getDetailMessage({int id}) async {
    await Future.delayed(Duration(seconds: 1));
    final result =
        await UtilAsset.loadJson("assets/data/message_detail_$id.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Notification
  static Future<dynamic> getNotification() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/notification.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get ProductDetail and Product Detail Tab
  static Future<dynamic> getProductDetail({id: 0, tabExtend: false}) async {
    await Future.delayed(Duration(seconds: 1));
    String path = "assets/data/product_detail_$id.json";
    if (tabExtend) {
      path = "assets/data/product_detail_tab_$id.json";
    }
    final result = await UtilAsset.loadJson(path);
    return ResultApiModel.fromJson(result);
  }
  

  ///Get History Search
  static Future<dynamic> getHistorySearch() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/search_history.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Wish List edited sanjana
  static Future<List<ShopModel>> getWishList() async {
    await Future.delayed(Duration(seconds: 1));
 final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/locations');
   print('getPopular():$result.runT');
   return ShopModel.listFromJson(result['locations']);
    // final result = await UtilAsset.loadJson("assets/data/wishlist.json");
    // return ResultApiModel.fromJson(result);
  }

  ///On Search
  static Future<dynamic> onSearchData() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/search_result.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Location List
  static Future<dynamic> getLocationList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/location.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Product List
  static Future<dynamic> getProduct() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/product_list.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Review
  static Future<dynamic> getReview() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/review.json");
    return ResultApiModel.fromJson(result);
  }
  // @sanjana 

  static Future<List<MyLocation>> getPopular() async {
    await Future.delayed(Duration(seconds: 1));
   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  //  print('getPopular():${result['data']['locations']}');
   return MyLocation.listFromJson(result['data']['popular']);

  }
   
   static Future<List<CategoryModel2>> getCategoryList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  //  print('getCategoryList():${result['data']['category']}');
   return CategoryModel2.listFromJson(result['data']['category']);
  }

   static Future<List<ShopModel>> getShops() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  //  print('getShops():$result.runT');
   return ShopModel.listFromJson(result['data']['list']);
  }
 static Future<List<PopularPageModel>> getHomeData() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  //  print('getHomeData():$result.runT');
   return PopularPageModel.listFromJson(result['data']);
  }

  // sanjana TAB
    static Future<List<TabModel>> getTabDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendor?id='+id.toString());
    print('...........getTabDetail()............:$result');
    return TabModel.listFromJson(result['data']['tab']);
  }

   


  ///Singleton factory
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal();

}
