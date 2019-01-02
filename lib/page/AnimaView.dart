import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/help/common.dart';

class AnimaView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  double _r;
  Color _color;
  int _num;

  AnimaView(this.context, double r, Color color, int num) {
    // print('AnimaView r = $r');
    mPaint = new Paint();
    // mPaint.color = Colors.deepOrange;
    // mPaint.style=PaintingStyle.stroke;
    mPaint.isAntiAlias=true;
    _r = r;
    _color = color;
    mPaint.color = _color;
    _num = num;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;

    drawGrid(canvas, winSize);
    
    drawCoo(canvas, new Size(winSize.width / 2 , winSize.height / 2 - 50), winSize);

    canvas.translate(winSize.width / 2 , winSize.height / 2 - 50);//移动到坐标系原点
    canvas.drawPath(nStarPath(_num, _r, 66), mPaint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}