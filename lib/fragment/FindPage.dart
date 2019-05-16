import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:myapp/view/find/SelectImage.dart';

//void main() => runApp(new FindPage());

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> {
  Widget _itemBuilder(BuildContext context, int index) {
    return displayData(index);
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(microseconds: 2), () {
      //      getTeamInfo();
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(microseconds: 2), () {
//      getTeamInfo();

    });
  }
  @override
  Widget build(BuildContext context) {
    String _currentMenuItem="Home";
    Widget popupMenuButtonDemo = new Row(children: <Widget>[
      Text(_currentMenuItem),
      PopupMenuButton(
        onSelected: (value) {
        if(value=="0"){
         Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
           return SelectImage();
         }));
        }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: Text("Home"),value: "Home",
          ),
          PopupMenuItem(
            child: Text("发状态"),value: "0",
          ),
          PopupMenuItem(
            child: Text("分享"),value: "1",
          ),
        ],
      )
    ]);
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
          popupMenuButtonDemo
        ],
      ),
      body: posts.length>0?Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return new Container(
              child: new ListView.builder(
            physics: physics,
            controller: controller,
            itemBuilder: _itemBuilder,
            itemCount: posts.length,
          ));
        },
      ):_loading(),
    );
  }




  displayData(index) {
    return new Card(
      child: Column(
        children: <Widget>[
          new ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(posts[index].ImgUrl),
            ),
            title: Text(posts[index].title),
            subtitle: Text(posts[index].author),
          ),
          new AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
              child: Image.network(
                posts[index].ImgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.all(16.0),
            child: Text(posts[index].content),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
//                  child: Text("Like".toUpperCase()),
                  child: Icon(Icons.favorite,color: Colors.grey,),
                ),
                FlatButton(
                  onPressed: () {},
//                  child: Text("Read".toUpperCase()),
                  child: Icon(Icons.message,color: Colors.grey,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _loading() {
    return new Container(
      height: 400.0,
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
              new Text("正在加载......"),
            ],
          )),
    );
  }
}
