import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/Config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/common/net/api.dart';
import 'dart:io';
import 'dart:convert';

var dio = new Dio();

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
  static void _request(String url, Function callBack,
      {String method,
      Map<String, String> params,
      Function errorCallBack}) async {
    String errorMsg = "";
    int statusCode;
    try {
      //检查网络状态
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "网络未连接");
        return;
      }
      if (!url.startsWith("http")) {
        dio.options.baseUrl = Config.DEBUG ? DEV : ONLINE;
      }
      Response response;
      dio.options.connectTimeout = 15000;
      dio.options.headers = {
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
        dio.interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          print("\n================== 请求数据 ==========================");
          print("请求url = ${options.uri.toString()}");
          print("headers = ${options.headers}");
          print("params = ${options.data}");
        }, onResponse: (Response response) {
          print("\n================== 响应数据 ==========================");
          print("code = ${response.statusCode}");
          print("返回数据 = ${response.data}");
          print("\n");
        }, onError: (DioError e) {
          print("\n================== 错误响应数据 ======================");
          print("type = ${e.type}");
          print("message = ${e.message}");
          print("stackTrace = ${e.stackTrace}");
          print("\n");
        }));
      }
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else {
        if (params != null && params.isNotEmpty) {
          // FormData formData = new FormData.from(params);
          response = await dio.post(url, queryParameters: params);
        } else {
          response = await dio.post(url);
        }
      }
      statusCode = response.statusCode;
      print("返回数据:" + response.toString());
      if (statusCode == HttpStatus.OK) {
        var data = json.decode(response.toString()); //对数据进行Json转化
        callBack(data["data"]);
      } else {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
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
