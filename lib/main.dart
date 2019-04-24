import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new MyHomePage(title: "hello flutter"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Text("hello"),
      ),
      body: new ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.library_music,
                    color: Colors.blue,
                  ),
                  Text("hello")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.library_music,
                    color: Colors.blue,
                  ),
                  Text("hello")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.library_music,
                    color: Colors.blue,
                  ),
                  Text("hello")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.library_music,
                    color: Colors.blue,
                  ),
                  Text("hello")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.library_music,
                    color: Colors.blue,
                  ),
                  Text("hello")
                ],
              ),
            ],
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                color: Colors.blue,
                child: Icon(
                  Icons.satellite,
                  size: 80.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text("标题"), Text("内容部分......")],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("2019-4-3"),
              ),
            ],
          ),

          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Icon(
                  Icons.satellite,
                  size: 80.0,
                ),
                flex: 1,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text("标题"), Text("内容部分......")],
                ),
                flex: 2,
              ),
              Flexible(
                child: Text("2019-4-3"),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
