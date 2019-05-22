import 'package:flutter_app/common/util/Config.dart';

const String DEV = "http://c.dev.aixuexi.com/";
const String ONLINE = "http://c.aixuexi.com/";

const String PASSWORD_LOGIN = "password/login";
const String LOGIN_SUCCESS = "student/loginSuccess";
const String FRIEND_WEBSITE = "https://www.wanandroid.com/banner/json";

String fillUrl(String url, {List params}) {
  String s = Config.DEBUG ? DEV + url : ONLINE + url;
  if (null == params || params.length == 0) {
    return s;
  }
  params.forEach((dynamic p) {
    if (s.contains("{param}")) {
      s = s.replaceFirst("{param}", p.toString());
    }
  });
  return s;
}
