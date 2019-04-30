import 'package:flutter/material.dart';

//void main() => runApp(new FindPage());

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: new GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text(
          "发现",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          new FlatButton(
            onPressed: () {},
            child: Text(
              "分享",
            ),
          ),
        ],
      ),
      body: new Center(
        child: Text("发现"),
      ),
    );
  }
}
