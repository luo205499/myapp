import 'package:flutter/material.dart';
import 'package:myapp/view/MainPage.dart';
import 'package:myapp/view/AnimationWidget.dart';
import 'package:myapp/view/CheckBoxPage.dart';
import 'package:myapp/view/SliverGirldPage.dart';
import 'package:myapp/view/LoginPage.dart';
import 'package:myapp/view/BottomNavigationPage.dart';
import 'package:myapp/view/ButtonPage.dart';
import 'package:myapp/view/DataTimePage.dart';
import 'package:myapp/view/DataTablePage.dart';
import 'package:myapp/view/CardPage.dart';
import 'package:myapp/view/StepperPage.dart';


class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  var _controller;

  List<Tab> tabar = <Tab>[
    Tab(text: "直播"),
    Tab(text: "卡片"),
    Tab(text: "步骤"),
    Tab(text: '动画'),
    Tab(text: "小部件"),
    Tab(text: "小块可视口"),
    Tab(text: "登录"),
    Tab(text: "按钮"),
    Tab(text: "时间"),
    Tab(text: "数据表"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: tabar.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 250, 150, 150),
//          highlightColor: Color.fromRGBO(240, 100, 60, 0.3),
//          splashColor: Color.fromRGBO(240, 100, 60, 0.7),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              new GestureDetector(child: Icon(Icons.menu),onTap: (){
                Scaffold.of(context).openDrawer();
              },),
              Container(
                margin: EdgeInsets.only(left: 8.0),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 4),
                width: 180.0,
                height: 30.0,
                child: Icon(
                  Icons.search,
                  color: Colors.white30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.black38,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.settings_overscan,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),

//        bottomNavigationBar: BottomNavigationPage(),
        body: new Column(
          children: <Widget>[
           new Container(
              height: 53.0,
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 240, 100, 60),
                indicatorSize: TabBarIndicatorSize.label,
//               indicator: BoxDecoration(color: Colors.red),
                labelColor: Color.fromARGB(255, 240, 100, 60),
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: tabar,
                controller: _controller,
              ),
            ),
            new Container(
              height: 2.0,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            new Expanded(
              child: TabBarView(
                children: <Widget>[
                  MainPage(),
                  CardPage(),
                  StepperPage(),
                  AnimationWidget(),
                  CheckBoxPage(),
                  SliverGirldPage(),
                  LoginPage(),
                  ButtonPage(),
                  DataTimePage(),
                  DataTablePage(),
                ],
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
