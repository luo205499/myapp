import 'package:flutter/material.dart';
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            child: Image.asset(
              "images/beauty.jpg",
              fit: BoxFit.cover,
              height: 120.0,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/lol.png",
                    height: 25.0,
                    width: 50.0,
                  ),
                ),
                Text("英雄联盟"),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/jdqs.png",
                    height: 25.0,
                    width: 50.0,
                  ),
                ),
                Text("绝地求生"),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/splt.png",
                    height: 25.0,
                    width: 50.0,
                  ),
                ),
                Text("视频聊天"),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/5.png",
                    height: 25.0,
                    width: 50.0,
                  ),
                ),
                Text("第五人格"),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/dnf.jpg",
                    fit: BoxFit.cover,
                    height: 25.0,
                    width: 50.0,
                  ),
                ),
                Text("全部标签"),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 13.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      "images/game.jpg",
                      height: 25.0,
                      width: 50.0,
                    ),
                  ),
                  Text("游戏"),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      "images/phoneGame.jpg",
                      height: 25.0,
                      width: 50.0,
                    ),
                  ),
                  Text("手游"),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      "images/yl.jpg",
                      height: 25.0,
                      width: 50.0,
                    ),
                  ),
                  Text("娱乐"),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      "images/dt.jpg",
                      height: 25.0,
                      width: 50.0,
                    ),
                  ),
                  Text("电台"),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      "images/huiHua.jpg",
                      fit: BoxFit.cover,
                      height: 25.0,
                      width: 50.0,
                    ),
                  ),
                  Text("绘画"),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 1.0,
          color: Colors.black12,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("我的关注"),
              ),
              Text(
                "16个小时前",
                style: TextStyle(color: Colors.black26),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("宁采臣、在唱歌"),
              ),
              Text(
                "直播了当当电台",
                style: TextStyle(color: Colors.black26),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 1.0,
          color: Colors.black12,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("推荐直播"),
              Row(
                children: <Widget>[
                  Text(
                    "换一换",
                    style: TextStyle(color: Colors.black12),
                  ),
                  Icon(
                    Icons.autorenew,
                    color: Colors.black12,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 510.0,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(0.0)),
                        child: Image.asset(
                          "images/beauty.jpg",
                          fit: BoxFit.cover,
                          height: 100.0,
                          width: 180.0,
                        ),

                      ),
                      Text("我是你的美少女"),
                      Text(
                        "其他主播",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 6),
        )
      ],
    );
  }

}