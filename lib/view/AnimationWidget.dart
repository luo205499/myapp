import 'package:flutter/material.dart';

//void main() => runApp(new AnimationWidget());

class AnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationWidgetState();
  }
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  var radius = 44.0;
  double xs = 2.3;
  double ys = 2.3;
  AnimationController animationController;
  Animation<double> tween;

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);
    tween =
        new Tween<double>(begin: 50.0, end: 220.0).animate(animationController);
    tween.addListener(() {
      setState(() {
        print(tween.value);
        radius = radius + 20;
        xs = 2.3 - tween.value / 200 * 2.3;
        ys = 2.3 - tween.value / 200 * 2.3;
      });
    });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
            child: new Stack(
      alignment: Alignment(xs, ys),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 500.0,
        ),
        Container(
          width: tween.value,
          height: tween.value,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, tween.value.toInt() + 20,
                tween.value.toInt() - 100, tween.value.toInt() - 100),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            boxShadow: [
              BoxShadow(
              offset: Offset(0, 16.0),
              color: Colors.red.withOpacity(0.6),
              blurRadius: 25.0,
              spreadRadius: -9.0,
            ),
            ],
          ),
        ),
      ],
    )));
  }
}
