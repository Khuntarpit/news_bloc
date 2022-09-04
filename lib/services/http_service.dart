import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_bloc/Utils/appUrls.dart';
import 'package:news_bloc/utils/constants.dart';
import 'package:news_bloc/utils/utils.dart';
import 'package:news_bloc/utils/myStrings.dart';


class HttpService {
  late Dio _dio;

  HttpService(){
    init();
  }

// http get request
  Future getRequest(String url) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("url " + url);
      response = await _dio.get(url).catchError((e) => throw Exception(e));
      printLog("response.get ${response.data}");
    } catch (e) {
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }
// http post request
  Future postRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("url ${url}");
      printLog("rowData ${rowData}");
      response = await _dio.post(url,data: rowData).catchError((e) => throw Exception(e));
      printLog("response.post ${response.data}");
    } catch (e) {
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }
// http patch request
  Future patchRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("rowData.patch ${jsonEncode(rowData)}" );
      printLog("url " + url);
      response = await _dio.patch(url,data: rowData);
      printLog("response.patch ${response.data}");
    } catch (e) {
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http put request
  Future putRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("rowData.put ${jsonEncode(rowData)}" );
      printLog("url " + url);
      response = await _dio.put(url,data: rowData);
      printLog("response.put ${response.data}");
    } catch (e) {
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http delete request
  Future deleteRequest(String url) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("url " + url);
      response = await _dio.delete(url);
      printLog(response.toString());
    } catch (e) {
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
      onError: (e, handler) async {
        printErrorLog("statusCode ${e.response?.statusCode.toString()}");
        printErrorLog("error ${e.response?.data.toString()}");
        switch (e.response?.statusCode) {
          case 400: //Bad Request
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg : MyStrings.something_wrong);
            break;
          case 404: // Not Found
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  MyStrings.something_wrong);
            break;
          case 500: //Internal Server Error
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  MyStrings.something_wrong);
            break;
          case 501: //Internal Server Error
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  MyStrings.something_wrong);
            break;

          default:
            Utils.showToast(MyStrings.something_wrong);
            break;
        }
        handler.next(e);
      },
    ));
  }

  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: AppUrls.baseurl,
        followRedirects: false,
        connectTimeout: 60*1000, // 120 seconds
        receiveTimeout: 60*1000
    ));
    initializeInterceptors();
  }
}