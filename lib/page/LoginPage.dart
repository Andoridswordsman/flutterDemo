import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/ASStyle.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_app/widget/ASFlexButton.dart';
import 'package:flutter_app/widget/ASInputWidget.dart';
import 'package:flutter_app/common/net/HttpManager.dart';
import 'package:flutter_app/common/net/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {

  static final String sName = "login";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  String password = "";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  _LoginPageState() : super();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    initParams();
  }

  initParams() async {
    userController.value = new TextEditingValue(text: username);
    pwController.value = new TextEditingValue(text: password);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Color(ASColors.white),
      child: new Card(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        margin: new EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
        child: new Padding(
          padding: new EdgeInsets.all(30.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Image(image: new AssetImage('static/images/app_icon.png'),
                  width: 80.0,
                  height: 80.0),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new ASInputWidget(
                  hintText: "请输入账号",
//                  controller: userController,
                  onChanged: (String value) {
                    // print(value);
                    username = value;
                  },
                  iconData: Icons.access_alarm),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new ASInputWidget(
                  hintText: "请输入密码",
//                  controller: pwController,
                  obscureText: true,
                  onChanged: (String value) {
                    // print(value);
                    password = value;
                  },
                  iconData: Icons.access_alarm),
              new Padding(padding: new EdgeInsets.all(20.0)),
              new ASFlexButton(
                text: "登录",
                color: Color(ASColors.primaryValue),
                textColor: Color(ASColors.textWhite),
                onPress: () {
                  if (username == null || username.length == 0) {
                    Fluttertoast.showToast(msg: "账号不能为空");
                    return;
                  }
                  if (password == null || password.length == 0) {
                    Fluttertoast.showToast(msg: "密码不能为空");
                    return;
                  }
                  Fluttertoast.showToast(msg: "login");
                  var params = {
                    "username": username,
                    "password": password
                  };
                  HttpManager.post(PASSWORD_LOGIN, (data) {
                    setState(() {
                      Fluttertoast.showToast(msg: data.toString());
                    });
                    Navigator.pushReplacementNamed(context, HomePage.sName);
                  }, params: params, errorCallBack: (errorMsg) {
                    Fluttertoast.showToast(msg: errorMsg);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}