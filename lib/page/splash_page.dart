import 'package:flutter/material.dart';
import 'package:flutter_app/common/util/SPUitl.dart';
import 'package:flutter_app/page/home_page.dart';
import 'package:flutter_app/page/login_page.dart';

class SplashPage extends StatefulWidget {
  static final String sName = "/";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//    new Future.delayed(const Duration(seconds: 2),() {
//      Navigator.pushReplacementNamed(context, HomePage.sName);
//    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    new Future.delayed(const Duration(seconds: 2), () async {
      try {
        bool isLogin = await SPUtil.get("isLogin") ?? false;
        if (isLogin == true) {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute(builder: (context) {
            return new HomePage();
          }));
        } else {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute(builder: (context) {
            return new LoginPage();
          }));
        }
      } catch (e) {}
    });
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Image(image: new AssetImage("static/images/splashing.jpg")),
      ),
    );
  }
}
