import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/help/common.dart';

class StarView extends CustomPainter {

  Paint mPaint;
  BuildContext context;

  StarView(this.context, Color color) {
    print('StarView color $color');
    mPaint = new Paint();
    mPaint.color = color;
    // mPaint.style=PaintingStyle.stroke;
    mPaint.isAntiAlias=true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;

    drawGrid(canvas, winSize);
    
    drawCoo(canvas, new Size(winSize.width / 2 , winSize.height / 2 - 50), winSize);

    canvas.translate(winSize.width / 2 , winSize.height / 2 - 50);//移动到坐标系原点
    canvas.drawPath(nStarPath(5, 80, 40), mPaint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}