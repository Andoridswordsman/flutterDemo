import 'dart:collection';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/Config.dart';
import 'package:flutter_app/common/net/ResultData.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/common/net/Address.dart';

class HttpManager {
  static const String GET = "get";
  static const String POST = "post";

  //get请求
  static void get(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: GET, params: params, errorCallBack: errorCallBack);
  }

  //post请求
  static void post(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: POST, params: params, errorCallBack: errorCallBack);
  }

  //具体的还是要看返回数据的基本结构
  //公共代码部分
  static void _request(String url, Function callBack, {String method, Map<String, String> params, Function errorCallBack}) async {
    String errorMsg = "";
    int statusCode;
    try {
      //检查网络状态
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "网络未连接");
        return;
      }
      Fluttertoast.showToast(msg: "登录请求");
      Dio dio = new Dio();
      Options options;
      if (method == GET) {
        options = new Options(method: "GET");
      } else {
        options = new Options(method: "POST");
      }
      Response response;
      // options.baseUrl = Config.DEBUG ? Address.dev_host : Address.online_host;
      options.connectTimeout = 15000;
      options.headers = {
        'User-Agent': 'WeAppPlusPlayground/1.0',
        "appId": "1",
        "X-Requested-With": "X-Requested-With",
        "Content-Type": "application/json;charset=UTF-8",
        "apiVersion": "v4",
        "appVersionName": Config.appVersion,
        "systemType": Config.systemType, 
        "systemVersion": Config.systemVersion,
        "deviceId": Config.deviceId,
        "deviceType": Config.deviceType,
        "channel": Config.channel,
//      "token": Config.TOKEN,
      };

      // 添加拦截器
    if (Config.DEBUG) {
      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options){
            print("\n================== 请求数据 ==========================");
            print("url = ${options.uri.toString()}");
            print("headers = ${options.headers}");
            print("params = ${options.data}");
          },
          onResponse: (Response response){
            print("\n================== 响应数据 ==========================");
            print("code = ${response.statusCode}");
            print("data = ${response.data}");
            print("\n");
          },
          onError: (DioError e){
            print("\n================== 错误响应数据 ======================");
            print("type = ${e.type}");
            print("message = ${e.message}");
            print("stackTrace = ${e.stackTrace}");
            print("\n");
          }
      ));
    }
//      dio.onHttpClientCreate = (HttpClient client) {
//        // config the http client
//        client.findProxy = (uri) {
//          //proxy all request to localhost:8888
//          return "PROXY 10.31.1.74:8888";//10.31.1.74:8888  192.168.5.109:8009
//        };
//        // you can also create a new HttpClient to dio
//        // return new HttpClient();
//      };

//      url = Address.fillUrl(url);
      print("请求url :<" + method + ">" + url);
      if (params != null && params.isNotEmpty) {
        print("请求参数 :" + params.toString());
      }
      url = (Config.DEBUG ? Address.dev_host : Address.online_host) + url;
      FormData formData = new FormData.from(params);
      response = await dio.request(url, data: formData, options: options);
      print("请求header :" + options.headers.toString());
      // if (method == GET) {
      //   //组合GET请求的参数
      //   if (params != null && params.isNotEmpty) {
      //     StringBuffer sb = new StringBuffer("?");
      //     params.forEach((key, value) {
      //       sb.write("$key" + "=" + "$value" + "&");
      //     });
      //     String paramStr = sb.toString();
      //     paramStr = paramStr.substring(0, paramStr.length - 1);
      //     url += paramStr;
      //   }
      //   response = await dio.get(url);
      // } else {
      //   StringBuffer sb = new StringBuffer("?");
      //     params.forEach((key, value) {
      //       sb.write("$key" + "=" + "$value" + "&");
      //     });
      //     String paramStr = sb.toString();
      //     paramStr = paramStr.substring(0, paramStr.length - 1);
      //     url += paramStr;
      //   // if (params != null && params.isNotEmpty) {
      //   //   response = await dio.post(url, data: params);
      //   // } else {
      //     response = await dio.post(url);
      //   // }
      // }

      statusCode = response.statusCode;
      print("返回数据:" + response.toString());
      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data["data"]);
//        print("返回数据:" + response.data["data"]);
      }
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("请求失败 :" + errorMsg);
  }
}