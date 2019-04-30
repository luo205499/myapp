import 'package:flutter/material.dart';
class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            "lcl",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          accountEmail: Text("lcl123456@qq.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "http://119.23.51.242:8080/images/1555577867108_IMG_2766.JPG"),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://resources.ninghao.net/images/overkill.png",),
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