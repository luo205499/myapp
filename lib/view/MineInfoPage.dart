import 'package:flutter/material.dart';


class MineInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineInfoPageState();
  }
}

class _MineInfoPageState extends State<MineInfoPage> {

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
        title: Text("个人信息",style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          new FlatButton(onPressed: (){}, child: Text("设置",),),
        ],
      ),
      body: new Center(
        child: Text("个人信息"),
      ),
    );
  }
}
