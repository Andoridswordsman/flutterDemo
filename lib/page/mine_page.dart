import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<MinePage> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // flutterWebviewPlugin.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //return new WebviewScaffold(url: "http://www.baidu.com");
      return new Container(
        child: new Center(
          child: new Text(
            "fragment-mine",
            style: new TextStyle(color: Colors.blue,fontSize: 16.0),
          ),
        ),
      );
  }
}