import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page/AnimaView.dart';

class AnimaPage extends StatefulWidget  {
    
  @override
  _AnimaPageState createState() => _AnimaPageState();
}

class _AnimaPageState extends State<AnimaPage> 
    with TickerProviderStateMixin {

  AnimationController radius_controller;
  AnimationController color_controller;
  AnimationController num_controller;
  Animation<double> radius_animation;
  Animation<Color> color_animation;
  Animation<int> num_animation;
  double _r = 25;
  int _num = 5;
  Color _color = Colors.deepOrange;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      // 创建 AnimationController 对象
      //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源 
      radius_controller = AnimationController(
        duration: const Duration(
          milliseconds: 2000
        ),
        vsync: this,
      );
      radius_animation = Tween(
        begin: 25.0,
        end: 150.0,
      ).animate(CurveTween(curve: Cubic(0.96, 0.13, 0.1, 1.2)).animate(radius_controller))
      ..addListener(
        () {
          setState(() {
            _r = radius_animation.value;
            _num = radius_animation.value.toInt();
          });
        }
      )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          radius_controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          radius_controller.forward();
        }
      });
      color_controller = AnimationController(
        duration: const Duration(
          milliseconds: 2000
        ),
        vsync: this,
      );
      color_animation = ColorTween(
        begin: Colors.deepOrange,
        end: Colors.yellow,
      ).animate(color_controller)..addListener(
        () {
          setState(() {
            _color = color_animation.value;
          });
        }
      );
      /* num_controller = AnimationController(
        duration: const Duration(
          milliseconds: 2000
        ),
        vsync: this,
      );
      num_animation = Tween(
        begin: 5,
        end: 125,
      ).animate(num_controller)..addListener(
        () {
          setState(() {
            _num = num_animation.value;
          });
        }
      ); */
    }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      radius_controller.dispose(); // 资源释放
      color_controller.dispose();
      // num_controller.dispose();
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('动画页面')
        ),
        body: CustomPaint(
          painter: AnimaView(context, _r, _color, _num),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            radius_controller.forward();
            color_controller.forward();
            // num_controller.forward();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    }

}