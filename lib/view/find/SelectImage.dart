import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySelectImage();
  }
}

class MySelectImage extends State {
  List imgList = new List<File>();
  bool fromGallery = false;
  String textHelp = "说说你的烦恼，让大家开心一下...";

  Future getImage(fromGallery) async {
    var imageSource =
        fromGallery == false ? ImageSource.gallery : ImageSource.camera;
    var image = await ImagePicker.pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        imgList.add(image);
      });
    }
  }

  dynamic getBody() {
    if (showLoadingDialog()) {
      return Text("");
    } else {
      return getListView();
    }
  }

  bool showLoadingDialog() {
    if (imgList.length == 0) {
      return true;
    }

    return false;
  }

  void dialogImg() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: Text("选择图片"),
            children: <Widget>[
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(true);
                },
                child: Text("拍摄"),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(false);
                },
                child: Text("从相册选取"),
              ),
            ],
          );
        });
  }

  Widget getListView() => new GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Image.file(
                imgList[index],
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
            ),
            Positioned(
              top: 2.0,
              right: 12.0,
              child: GestureDetector(
                child: Container(
                  color: Colors.grey.withOpacity(0.6),
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  print("删除${index}");
                  setState(() {
                    imgList.removeAt(index);
                  });
                },
              ),
            ),
          ],
        );
      },
      itemCount: imgList.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '发状态',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(10.0),child: TextField(
              decoration: InputDecoration(
                labelText: textHelp,
                labelStyle: TextStyle(color: Colors.grey),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxLines: 30,
              onChanged: (value) {
                setState(() {
                  textHelp = "";
                });
              },
            ),),
            flex: 2,
          ),
          Expanded(
            child: getBody(),
            flex: 3,
          ),
        ],
      ),
//      FlatButton(onPressed: (){dialogImg();}, child: Text("添加图片")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogImg();
        },
        tooltip: '添加图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
