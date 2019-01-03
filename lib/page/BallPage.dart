import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page/BallView.dart';
import 'package:myapp/help/common.dart';

class BallPage extends StatefulWidget  {
    
  @override
    _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> 
    with TickerProviderStateMixin {
  
  Ball _ball;
  Rect _limit = Rect.fromLTRB(-140, -100, 140, 100);//矩形边界
  AnimationController controller;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      _ball = Ball(x:_limit.left + 10, y:0, color: Colors.blue, r:10, aX: 0, aY: 0, vX:1, vY: 2);

      // 创建 AnimationController 对象
      //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
      controller = AnimationController(
        duration: const Duration(milliseconds: 200000), vsync: this);
      
      controller.addListener(() {
        updateBall();
        setState(() {
        }); 
      });
    }
  
  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      controller.dispose(); // 资源释放
    }
  
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('小球动画页面')
        ),
        body: CustomPaint(
          painter: BallView(context, _ball, _limit),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.forward(); //执行动画
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    }

  updateBall() {
    //运动学公式
    _ball.x += _ball.vX;
    _ball.y += _ball.vY;
    _ball.vX += _ball.aX;
    _ball.vY += _ball.aY;
    //限定下边界
    if (_ball.y > _limit.bottom - _ball.r) {
      _ball.y = _limit.bottom - _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color = randomRGB();//碰撞后随机色
    }
    //限定上边界
    if (_ball.y < _limit.top + _ball.r) {
      _ball.y = _limit.top + _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color = randomRGB();//碰撞后随机色
    }
    // 限定左边界
    if (_ball.x < _limit.left + _ball.r) {
      _ball.x = _limit.left + _ball.r;
      _ball.vX = -_ball.vX;
      _ball.color = randomRGB();//碰撞后随机色
    }
    // 限定右边界
    if (_ball.x > _limit.right - _ball.r) {
      _ball.x = _limit.right - _ball.r;
      _ball.vX = -_ball.vX;
      _ball.color = randomRGB();//碰撞后随机色
    }
  }
}
