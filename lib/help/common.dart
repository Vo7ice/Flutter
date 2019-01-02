import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  
  /**
   * 绘制网格
   * 
   */
  drawGrid(Canvas canvas, Size winSize, [int step = 20, int color = 0xff06BDF8]) {
    var paint = new Paint();
    paint.color = Color(color);
    paint.style=PaintingStyle.stroke;
    paint.isAntiAlias=true;
    canvas.drawPath(gridPath(step, winSize), paint);
  }

  /**
   * 绘制坐标系
   */
  drawCoo(Canvas canvas, Size coo, Size winSize,) {
    // 初始化画笔
    Paint paint = new Paint();
    paint.color = Colors.black87;
    paint.strokeWidth = 2;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;
    paint.isAntiAlias = true;

    // 绘制四象限
    canvas.drawPath(cooPath(coo, winSize), paint);

    // 箭头
    canvas.drawLine(new Offset(winSize.width, coo.height), 
      new Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height), 
      new Offset(winSize.width - 10, coo.height + 6), paint);

    canvas.drawLine(new Offset(coo.width, winSize.height - 90), 
      new Offset(coo.width - 6, winSize.height - 10 - 90), paint);
    canvas.drawLine(new Offset(coo.width, winSize.height - 90), 
      new Offset(coo.width + 6, winSize.height - 10 - 90), paint);
  }

  /**
   * 网格路径
   * 
   * @param step   边长
   * @param winSize 屏幕尺寸
   * 
   */
  Path gridPath(int step, Size winSize) {
    Path path = new Path();

    // x
    for (var i = 0; i < winSize.height / step + 1; i++) {
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    // y
    for (var i = 0; i < winSize.width/ step + 1; i++) {
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }

  Path cooPath(Size coo, Size winSize) {
    Path path = new Path();
    // x正半轴
    path.moveTo(coo.width, coo.height);
    path.lineTo(winSize.width, coo.height);

    // x负半轴
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width - winSize.width, coo.height);

    // y正半轴
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, winSize.height);

    // y负半轴
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, coo.height - winSize.height);
    return path;
  }

  /**
   * n角星路径
   * 
   * @param num 几角星
   * @param R 外接圆半径
   * @param r 内接圆半径
   * @return n角星path 
   */
  Path nStarPath(int num, double R, double r) {
    Path path = new Path();
    double preDeg = 360 / num; // 尖角的度数
    double degA = preDeg /2 /2;
    double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

    path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));

    for (var i = 0; i < num; i++) {
      path.lineTo(cos(_rad(degA + preDeg * i)) * R, -sin(_rad(degA + preDeg * i)) * R);
      path.lineTo(cos(_rad(degB + preDeg * i)) * r, -sin(_rad(degB + preDeg * i)) * r);
    }
    path.close();

    return path;
  }

  double _rad(double deg) {
    return deg * pi / 180;
  }

  /**
   * 画正n角星的路径:
   * 
   * @param num 角数
   * @param R   外接圆半径
   * @return 画正n角星的路径
   */
  Path regularStarPath(int num, double R) {
    double degA, degB;
    // 奇偶不同算法
    if (num % 2 == 1) {
      degA = 360 / num / 2;
      degB = 180 - degA - 360 / num / 2;
    } else {
      degA = 360 / num / 2;
      degB = 180 - degA - 360 / num / 2;
    }

    double r = R * sin(_rad(degA)) / sin(_rad(degB));

    return nStarPath(num, R, r);
  }
  
  /**
   * 画正n边形的路径
   * 
   * @param num 边数
   * @param R   外接圆半径
   * @return 画正n边形的路径
   */
  Path regularPolygonPath(int num, double R) {
    double r = R * cos(_rad(360 / num / 2));
    return nStarPath(num, R, r);
  }