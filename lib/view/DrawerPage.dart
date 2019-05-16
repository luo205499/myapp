import 'package:flutter/material.dart';
class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            "小雅",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
          accountEmail: Text("lcl123456@qq.com",style: TextStyle(color: Colors.white,)),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "http://g.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e770bd00d868ba61ea9d345f2.jpg"),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "http://g.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e770bd00d868ba61ea9d345f2.jpg",),
              fit: BoxFit.cover,
//              colorFilter: ColorFilter.mode(Color.fromARGB(255, 250, 150, 150), BlendMode.hardLight),
            ),
          ),
        ),
        /* DrawerHeader(
                child: Text("Header"),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),*/
        ListTile(
          title: Text("Message"),
          leading: Icon(
            Icons.message,
            color: Colors.black12,
            size: 22.0,
          ),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text("Favorite"),
          leading: Icon(
            Icons.favorite,
            color: Colors.black12,
            size: 22.0,
          ),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text("Setting"),
          leading: Icon(
            Icons.settings,
            color: Colors.black12,
            size: 22.0,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

}