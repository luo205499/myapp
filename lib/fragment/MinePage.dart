import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:myapp/view/MineInfoPage.dart';
//void main() => runApp(new MinePage());

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  var resultData = {
    "avatar": "https://resources.ninghao.net/images/overkill.png",
    "nickName": "Toni",
    "telephone": "13512411414"
  };

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
          "我的",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          new FlatButton(
            onPressed: () {},
            child: Text(
              "设置",
            ),
          ),
        ],
        bottom: PreferredSize(
          child: getTopInfo(),
          preferredSize: Size.fromHeight(90),
        ),
      ),
      body: new Container(
        child: ListView(
          children: <Widget>[
            getPersonalCollection(),
            setDivider(),
            getPersonalScore(),
            setDivider(),
            getLoginOut(),
            setDivider(),
          ],
        ),
      ),
    );
  }

  //头部信息展示
  getTopInfo() {
    return new Container(
      height: 70.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 75.0,
            height: 100.0,
            child: new CircleAvatar(
              backgroundImage: NetworkImage(
                resultData['avatar'],
              ),
            ),
          ),
          new Expanded(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  resultData['nickName'] == null
                      ? '未设置昵称'
                      : resultData['nickName'],
                  style: new TextStyle(color: Colors.white),
                  softWrap: false,
                ),
                new ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: new Container(
                    color: const Color(0x33FFFFFF),
                    child: new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: new Text(
                        resultData['telephone'] != null
                            ? resultData['telephone']
                                    .toString()
                                    .substring(0, 3) +
                                '****' +
                                resultData['telephone']
                                    .toString()
                                    .substring(7, 11)
                            : '***********',
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: new InkWell(
              child: new Align(
                alignment: Alignment.centerRight,
                child: new Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                await Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new MineInfoPage();
                }));
              },
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  setDivider() {
    return Divider(
      height: 0,
      color: Colors.grey,
    );
  }

  setInkWell(firstText, secondText, callback) {
    return new InkWell(
      onTap: callback,
      child: new Container(
        height: 50,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Row(
          children: <Widget>[
            firstText,
            new Container(
              child: Text(
                secondText,
                style: TextStyle(fontSize: 15),
              ),
              margin: EdgeInsets.only(left: 10),
            ),
            new Container(
              child: Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward,
                      size: 22.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPersonalScore() {
    return setInkWell(Icon(Icons.restore), '历史记录', () {
      print('--->');
    });
  }

  getPersonalCollection() {
    return setInkWell(Icon(Icons.favorite), '个人收藏', () {
      print('--->');
    });
  }

  getLoginOut() {
    return setInkWell(Icon(Icons.backspace), '退出登录', () {
      print('--->');
    });
  }
}
