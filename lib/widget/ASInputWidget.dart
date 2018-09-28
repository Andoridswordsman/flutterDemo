import 'package:flutter/material.dart';

class ASInputWidget extends StatefulWidget {

  final String hintText;

  final IconData iconData;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  ASInputWidget({Key key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ASInputWidgetState(hintText, iconData, onChanged, textStyle, controller);
  }
}

class _ASInputWidgetState extends State<ASInputWidget> {

  final String hintText;

  final IconData iconData;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  _ASInputWidgetState(this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: new InputDecoration(
        hintText: hintText,
        icon: new Icon(iconData),
      ),
    );
  }
}