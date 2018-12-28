import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarView extends CustomPainter {

  Paint mPaint;
  BuildContext context;

  StarView(this.context, Color color) {
    print('StarView color $color');
    mPaint = new Paint();
    mPaint.color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}