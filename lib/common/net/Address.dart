import 'package:flutter_app/common/util/Config.dart';

class Address {

  static const String dev_host = "http://c.dev.aixuexi.com/";
  static const String online_host = "http://c.aixuexi.com/";

  static const String password_login = "password/login";
  static const String login_success = "student/loginSuccess";

  static String fillUrl(String url, {List params}){
    String s = Config.DEBUG ? dev_host + url : online_host + url;
    if(null == params || params.length == 0){
      return s;
    }
    params.forEach((dynamic p){
      if(s.contains("{param}")) {
        s = s.replaceFirst("{param}", p.toString());
      }
    });
    return s;
  }

}