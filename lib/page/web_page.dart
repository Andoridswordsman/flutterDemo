import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bean/website.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  final Website data;
  
  WebPage(this.data);

  @override
  State<StatefulWidget> createState() => new _WebState();
}

class _WebState extends State<WebPage> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String title = widget.data.title == null
        ? widget.data.desc
        : widget.data.title;
    return new WebviewScaffold(
      url: widget.data.url,
      withJavascript: true,
      appBar: new AppBar(
        title: new Text(title),
      )
    );
  }
}