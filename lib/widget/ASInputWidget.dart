import 'package:flutter/material.dart';

class ASInputWidget extends StatefulWidget {

  final String hintText;

  final IconData iconData;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  final bool obscureText;

  ASInputWidget({Key key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ASInputWidgetState(hintText, iconData, onChanged, textStyle, controller, obscureText);
  }
}

class _ASInputWidgetState extends State<ASInputWidget> {

  final String hintText;

  final IconData iconData;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  final bool obscureText;

  _ASInputWidgetState(this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: new InputDecoration(
        hintText: hintText,
        icon: new Icon(iconData),
      ),
    );
  }
}