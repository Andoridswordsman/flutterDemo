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
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        } else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        }
      } catch (e) {}
    });
    return Container(
      color: Colors.white,
      child: Center(
        child: Image(image: AssetImage("static/images/splashing.jpg")),
      ),
    );
  }
}
