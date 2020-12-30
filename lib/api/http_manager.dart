import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as prefix;
import 'package:listar_flutter/utils/logger.dart';


String dioErrorHandle(DioError error) {
  UtilLogger.log("ERROR", error);
  switch (error.type) {
    case DioErrorType.RESPONSE:
      return error.response?.data['message'] ?? 'Unknown error';

    case DioErrorType.SEND_TIMEOUT:
    case DioErrorType.RECEIVE_TIMEOUT:
      return "request_time_out";

    default:
      return "connect_to_server_fail";
  }
}

class HTTPManager {
  prefix.FlutterSecureStorage flutterSecureStorage = prefix.FlutterSecureStorage();
  BaseOptions baseOptions = BaseOptions(
    baseUrl: "http://www.listar.passionui.com/index.php/wp-json",
    connectTimeout: 30000,
    receiveTimeout: 30000,
    headers: {},
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  ///Post method
  Future<dynamic> post({
    String url,
    Map<String, dynamic> data,
    Options options,
  }) async {
    UtilLogger.log("POST URL", url);
    UtilLogger.log("DATA", data);
    Dio dio = new Dio(baseOptions);
     getToken();
    try {
      final response = await dio.post(
        url,
        data: data,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      return {"message": dioErrorHandle(error)};
    }
  }

  ///Get method
  Future<dynamic> get({
    String url,
    Map<String, dynamic> params,
    Options options,
  }) async {
    UtilLogger.log("GET URL", url);
    UtilLogger.log("PARAMS", params);
    Dio dio = new Dio(baseOptions);
     getToken();
    try {
      final response = await dio.get(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      return {"message": dioErrorHandle(error)};
    }
  }
  
  Future<dynamic> getToken() async{
     Map<String, dynamic> headerParams = {};
    bool isLoggedIn = await flutterSecureStorage.containsKey(key:'token');
    if(isLoggedIn){
      String token = await flutterSecureStorage.read(key: 'token');
      headerParams = {'Authorization':'Bearer$token'};
    }
final nullableHeaderParams = headerParams.isEmpty?null:headerParams;
baseOptions.headers=nullableHeaderParams;
  }

  factory HTTPManager() {
    return HTTPManager._internal();
  }

  HTTPManager._internal();
}

HTTPManager httpManager = HTTPManager();
