import 'package:flutter/material.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isVisible = true;

  var editerTextContromer = TextEditingController();

  var towEditerTextContromer = TextEditingController();

  var threeEditerTextContromer= TextEditingController();

  double dx=0.0;
  double dy=0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 250, 150, 150)),
      home: Scaffold(
        appBar: isVisible?AppBar(
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "images/pic1.jpg",
                  width: 40.0,
                  height: 40.0,
                ),
              ),
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
        ):null,
        body:new Listener(
          onPointerDown: (pointEvent){
            print("dx=${pointEvent.position.dx}");
            print("dy=${pointEvent.position.dy}");
            dx=pointEvent.position.dx;
            dy=pointEvent.position.dy;
          },
          onPointerMove: (pointMoveEvent){
            print("pointMoveEvent=${pointMoveEvent.position.dx}");
            print("pointMoveEvent=${pointMoveEvent.position.dy}");
            if(dy-pointMoveEvent.position.dy<0){
              print("向上滑动");
              setState(() {
                isVisible=true;
              });
            }else{
              print("向下滑动");
              setState(() {
                isVisible=false;
              });

            }
          },
          child:  new ListView(
          children: <Widget>[
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.lightBlue,
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.green,
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.amber,
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.deepPurple,
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),),
    );
  }
}
