import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/fragment/HomeFragment.dart';
import 'package:myapp/fragment/FindPage.dart';
import 'package:myapp/fragment/MinePage.dart';
import 'package:myapp/view/DrawerPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new MainPageWidget());
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '发现', '我的'];

  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;


  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(
        appBarTitles[curIndex],
      );
    } else {
      return new Text(
        appBarTitles[curIndex],
      );
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {

    /*
     * 三个子界面
     */
    _pageList = [
      new HomeFragment(),
      new FindPage(),
      new MinePage(),
    ];
  }
  int last = 0;
  Future<bool> _onWillPop() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 800) {
      Fluttertoast.showToast(
          msg: '再次点击退出应用',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
//          backgroundColor: Colors.white,
          textColor: Colors.black);
      last = DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 250, 150, 150),
      ),
      home: new WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: Icon(Icons.explore), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person), title: getTabTitle(2)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: Drawer(
          child: DrawerPage(),
        ),
      ),
    ),);
  }

}
