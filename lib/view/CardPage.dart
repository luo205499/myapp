import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';

class CardPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardPage();
  }

}

class _CardPage extends State<CardPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(children: posts.map((post){
          return Card(
            child: Column(
              children: <Widget>[
                new AspectRatio(
                    aspectRatio: 16/9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),topRight: Radius.circular(12.0)),
                      child: Image.network(post.ImgUrl,fit: BoxFit.cover,),),
                ),
                new ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(post.ImgUrl),),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                new Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(post.content),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(onPressed: (){}, child: Text("Like".toUpperCase()),),
                      FlatButton(onPressed: (){}, child: Text("Read".toUpperCase()),),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList()),
      ),
    );
  }

}