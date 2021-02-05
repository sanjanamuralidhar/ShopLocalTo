import 'dart:async';
import 'dart:io';

// import 'package:flutter/material.dart';
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
    // print('this is username :$email');
    // print('this is password:$password');
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/login?email='+email+'&password='+password);
    // final result = await httpManager.post(url:Post_Login,data:{'email':username,'password':password});
    // final result = await UtilAsset.loadJson("assets/data/login.json");
    // final result = await httpManager.get(url:"http://dev.shoplocalto.ca/api/test");
    // print('this is the response:$result');
    // return ResultApiModel.fromJson(result);
    return result;
    
  }

  //SignUp api
  static Future<dynamic> signup({String username, String email, String password, String phone, String location}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/signup?name='+username+'&password='+password+'&email='+email+'&phone='+phone+'&location='+location);
    return result;
  }
  // /Update profile api
   static Future<dynamic> contactUs({String username, String email, String comment,}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/contact-us?name='+username+'&email='+email+'&comment='+comment);
    return result;
  }
//up[date chating session
    static Future<dynamic> chatWithUs({String comment,int companyid}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/messages?comment='+comment+'&company_id='+companyid.toString());
    return result;
  }

    // /Update profile api
   static Future<dynamic> editProfile({String username, String email, String address, String website, String phone,String info,File image}) async {
    // await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/update-profile?name='+username+'&email='+email+'&address='+address+'&website='+website+'&info='+info+'&phone='+phone,data:{'image':image});
    return result;
  }


  // /Update password api
   static Future<dynamic> editPassword({String password, String confirmpassword}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/update-password?password='+password+'&confirm_password='+confirmpassword);
    return result;
  }

  // Get sHOP DETAIL @SANJANA
  static Future<dynamic> getDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id=14'+id.toString());
    return result;
  }
 

  // // sanjana
  //  static Future<NearlyModel> getNearlyDetail({id: 0}) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
  //    print('...........getNearlyDetail()............:${result['data']['nearly']}');
  //   return NearlyModel.fromJson(result['data']['nearly']);
  // }
  

  // sanjana
   static Future<UserModel> getUserDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
    // print('...........getUserDetail()............:${result['data']['author']}');
    return UserModel.fromJson(result['data']['author']);
  }
   static Future<List<ImageModel>> getbannerPhoto({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
  //  print('getShops():$result.runT');
   return ImageModel.listFromJson(result['data']['photo']);
  }

   static Future<List<TabModel>> getTabDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
  //  print('getShops():$result.runT');
   return TabModel.listFromJson(result['data']['tabs']);
  }
 static Future<CategoryModel2> getCategoryDetailList({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/category-vendors?id='+id.toString());
  //  print('getCategoryDetailList():__________________________________${result['data']['list']}');
   return CategoryModel2.fromJson(result['data']);
  }
  ///id home required
  static Future<CategoryPageModel> getCategoryViewList() async{
  await Future.delayed(Duration(seconds: 1));
  final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  return CategoryPageModel.fromJson(result['data']);
}
  static Future<List<ListModel>> getListDetailList({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/category-vendors?id='+id.toString());
  //  print('getListDetailList():__________________________________${result['data']['list']}');
   return ListModel.listFromJson(result['data']['list']);
  }

   // sanjana
   static Future<ProductModel> getShopDataDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
     print('...........getShopDataDetail()............:${result['data']['id']}');
    return ProductModel.fromJson(result['data']);
  }
  // // sanjana
   static Future<PopularModel> getLocationDataDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/location-details?id='+id.toString());
    return PopularModel.fromJson(result['data']);
  }
  // sanjana
   static Future<List<RelatedModel>> getRelatedDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
    //  print('...........getRelatedDetail()............:${result['data']['feature']}');
    return RelatedModel.listFromJson(result['data']['related']);
  }
  // sanjana
   static Future<List<FeatureModel>> getFeatureDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
    //  print('...........getFeatureDetail()............:${result['data']['related']}');
    return FeatureModel.listFromJson(result['data']['feature']);
  }
   
  // sanjana
   static Future<List<NearbyModel>> getLocationNearbyDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/location-details?id='+id.toString());
    // print("//////////////////////////////////////////////////////////////////////////////////////////////////${result['data']['nearby']}");
    return NearbyModel.listFromJson(result['data']['nearby']);
   }
    static Future<List<ShopModel>> getLocationShopDetail({id: 0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/location-details?id='+id.toString());
    // print("//////////////////////////////////////////////////////////////////////////////////////////////////${result['data']['nearby']}");
    return ShopModel.listFromJson(result['data']['list']);
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

  // /Get Profile Detail
  static Future<UserModel> getUserProfile() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/user');
    print('this is ...............getUserProfile...........$result');
   return UserModel.fromJson(result);
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

  
  ///Get About Us sANJANA
  static Future<AboutUsModel> getAboutUsInfo() async {
    await Future.delayed(Duration(seconds: 1));
   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/about-us');
   print('getAboutUsInfo()..............#############>.........${result['data']['details']}');
    return AboutUsModel.fromJson(result['data']['details']);
  }

  ///Get Home
  static Future<HomePageModel> getHome({id:0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home?id='+id.toString());
     print('jdbvjkdbjkvbj fjbkjdb dbfubm fjkbd......mmmmmmmmmmmmmm....${result['data']['banners']}');
    return HomePageModel.fromJson(result['data']);
  }

  ///Get Messages
  static Future<dynamic> getMessage() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/message.json");
    return ResultApiModel.fromJson(result);
  }
///Get Messages list already chatted memebers list
  static Future<dynamic> getMessagesList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/allmessages');
    print('+++++++++++++++++++++++++++++++++++------------------------${result['data']}');
    return MessagePageModel.fromJson(result['data']);
  }

  ///Get Detail Messages
  static Future<dynamic> getDetailMessage({int id}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/message_detail_$id.json");
    print('$result');
    return ResultApiModel.fromJson(result);
  }

   ///Get Detail Messages
  static Future<dynamic> getVendorMessage({id:0}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/message-list?id='+id.toString());
    print('$result');
    return ChatPageModel.fromJson(result['data']);
  }

  ///Get Notification
  static Future<dynamic> getNotification() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/notification.json");
    return ResultApiModel.fromJson(result);
  }
  ///Get Notification sanjana
  static Future<NotificationPageModel> getUserNotification() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:"http://dev.shoplocalto.ca/api/notifications");
    print('jcbnujnddjndfvhnfjnvdfvhdfbnjv ........... fvjfbnjbnjbnjdnjcn kjcnjnj fbv d dv f ${result['data']}');
    return NotificationPageModel.fromJson(result['data']);
  }

  // /Get ProductDetail and Product Detail Tab
  static Future<dynamic> getProductDetail({id: 0, tabExtend: false}) async {
    await Future.delayed(Duration(seconds: 1));
    String path = "assets/data/product_detail_$id.json";
    if (tabExtend) {
      path = "assets/data/product_detail_tab_$id.json";
    }
    final result = await UtilAsset.loadJson(path);
    return ResultApiModel.fromJson(result);
  }

    static Future<ProductDetailTabPageModel> getLoadTabDetail({id: 0, tabExtend: false}) async {
    await Future.delayed(Duration(seconds: 1));
    String path = 'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString();
    if (tabExtend) {
      path = 'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString();
    }
    final result = await httpManager.post(url:path);
print('this is the............................... result tab data$result');
    return ProductDetailTabPageModel.fromJson(result);
  }

  // sanjana
  static Future<List<TabModel>> getTabtabDetail({id: 0, tabExtend: false}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/vendortabs?id='+id.toString());
    // print('this is the result tab data${result['data']['tabs']}');
    return TabModel.listFromJson(result['data']['tabs']);
  }
// getLIST SANJANA

static Future<ProductListPageModel> getList({id:0}) async{
  await Future.delayed(Duration(seconds: 1));
  final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/category-vendors?id='+id.toString());
  // print('/././//............./////...getList${result['data']}');
  return ProductListPageModel.fromJson(result['data']);
}

  static Future<ProductListPageModel> getSearchResult({id:0}) async {
    // await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/search-results?category_id='+id.toString());
  //  print('getShops():$result.runT');
   return ProductListPageModel.fromJson(result['data']['data']);
  }

  
    ///Get Product List
  // static Future<ProductListPageModel> getList({id: 0}) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/category-vendors?id='+id.toString());
  //   print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result['data']}');
  //   print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhgetListhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result['data']['list']}');
  //   return ProductListPageModel.fromJson(result['data']);
  // }
  //   static Future<List<ListModel>> getListList({id: 0}) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/category-vendors?id='+id.toString());
  //   print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result['data']}');
  //   print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhgetListhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result['data']['list']}');
  //   return ListModel.listFromJson(result['data']['list']);
  // }

  ///Get History Search
  static Future<dynamic> getHistorySearch() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilAsset.loadJson("assets/data/search_history.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Wish List edited sanjana
  static Future<dynamic> getWishList() async {
    await Future.delayed(Duration(seconds: 1));
//  final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/locations');
  //  print('getPopular():$result.runT');
  //  return ShopModel.listFromJson(result['locations']);
    final result = await UtilAsset.loadJson("assets/data/wishlist.json");
    return ResultApiModel.fromJson(result);
  }
  static Future<dynamic> getRefreshToken() async{
    await httpManager.post(url:'http://dev.shoplocalto.ca/api/refresh');
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

  

   static Future<HomePageModel> getHomePage({id:0}) async {
    await Future.delayed(Duration(seconds: 1));
   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home?id='+id);
  //  print('getPopular():${result['data']['locations']}');
   return HomePageModel.fromJson(result['data']);

  }

  static Future<List<MyLocation>> getPopular() async {
    await Future.delayed(Duration(seconds: 1));
   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
  //  print('getPopular():${result['data']['locations']}');
   return MyLocation.listFromJson(result['data']['popular']);

  }
// non token api
   static Future<List<MyLocation>> getSuggestedLocation() async {
    await Future.delayed(Duration(seconds: 1));
   final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/locations');
   return MyLocation.listFromJson(result['data']['locations']);

  }
   
   static Future<List<CategoryModel2>> getCategoryList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await httpManager.post(url:'http://dev.shoplocalto.ca/api/home');
   print('getCategoryList()..........................................................................................:${result['data']['category']}');
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

 

   


  ///Singleton factory
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal();

}