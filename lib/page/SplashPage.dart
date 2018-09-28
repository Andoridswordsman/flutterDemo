import 'package:flutter/material.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_app/page/LoginPage.dart';

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
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) {
        return new LoginPage();
      }));
    });
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Image(image: new AssetImage("static/images/splashing.jpg")),
      ),
    );
  }
}