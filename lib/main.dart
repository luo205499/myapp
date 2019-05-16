import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/SplashPage.dart';
import 'package:myapp/fragment/HomeFragment.dart';
import 'package:myapp/fragment/FindPage.dart';
import 'package:myapp/fragment/MinePage.dart';
import 'package:myapp/view/DrawerPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
