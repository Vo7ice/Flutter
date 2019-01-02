import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/help/common.dart';

class BallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;

  BallView(this.context, double r, Color color, int num) {
  }

  @override
    void paint(Canvas canvas, Size size) {

    }

  @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
}