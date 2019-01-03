import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/help/common.dart';

class BallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  Ball _ball;
  Rect _limit;
  List<Ball> _balllist;

  BallView(this.context, Ball ball, Rect limit) {
    mPaint = new Paint();
    _ball = ball;
    _limit = limit;
  }

  @override
    void paint(Canvas canvas, Size size) {
        var winSize = MediaQuery.of(context).size;
        drawGrid(canvas, winSize);
        drawCoo(canvas, new Size(winSize.width / 2 , winSize.height / 2 - 50), winSize);
        canvas.translate(winSize.width / 2 , winSize.height / 2 - 50);//移动到坐标系原点
        mPaint.color = Colors.pink[200];
        canvas.drawRect(_limit, mPaint);
        canvas.save();
        drawBall(canvas, _ball);
        canvas.restore();
        // canvas.drawCircle(new Offset(_ball.x, _ball.y), _ball.r, mPaint);
        
    }

  @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }

  drawBall(Canvas canvas, Ball ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(new Offset(ball.x, ball.y), ball.r, mPaint);
  }
}

class Ball {
  double aX;// x加速度
  double aY;// y加速度
  double vX;// x速度
  double vY;// y速度
  double x;// x坐标
  double y;// y坐标
  Color color;// 颜色
  double r;// 半径

  Ball({this.x, this.y,  this.color, this.r,this.vX, this.vY, this.aX, this.aY});
}