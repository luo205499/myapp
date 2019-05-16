import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/mainPage.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(new SplashPage1());
  if (Platform.isAndroid) {
    print("in");
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    //热部署情况下，必须重启，貌似是热部署不会重新执行main()
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class SplashPage1 extends StatelessWidget {
  SplashPage1({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: _SplashPageState());
  }

}

class _SplashPageState extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
}

class SplashPageState extends State<_SplashPageState>{
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void countDown() {
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, goToHomePage);
  }

  goToHomePage(){
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new MainPage1()),
            (route) => route == null);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: goToHomePage, //设置页面点击事件
      child: Image.asset(
        "images/pic2.jpg",
        fit: BoxFit.cover,
      ), //此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
    );
  }
}
