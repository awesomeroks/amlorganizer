import 'package:flutter/material.dart';

class MainScreenBtn extends StatefulWidget {
  MainScreenBtn({this.text, this.callback});
  String text;
  VoidCallback callback;
  _MainScreenBtnState createState() => _MainScreenBtnState();
}

class _MainScreenBtnState extends State<MainScreenBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.callback,
        child: Container(
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }
}
