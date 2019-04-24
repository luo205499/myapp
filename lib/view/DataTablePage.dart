import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';

class DataTablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataTablePage();
  }
}

class _DataTablePage extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            new DataTable(
              columns: [
                DataColumn(label: Text("Title")),
                DataColumn(label: Text("Author")),
                DataColumn(label: Text("Img")),
              ],
              rows: posts.map((post){
                return new DataRow(
                    cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author),),
                  DataCell(Container(width: 80.0,child: Image.network(post.ImgUrl,fit: BoxFit.cover,),),),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
