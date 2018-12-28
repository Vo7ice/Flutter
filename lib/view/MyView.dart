import 'package:flutter/material.dart';

class MyView extends StatelessWidget {
  final String text;

  MyView({Key key, this.text}) : super(key: key);

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      // Size window = MediaQuery.of(context).size;
      // window.width;
      // window.height;
      return Container(
        height: 56.0,
        alignment: Alignment.center,
        color: Colors.red,
        child: new Text(
          text ?? 'Empty View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0),
      );
    }
}