import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() => runApp(MinePhotoPage());

class MinePhotoPage extends StatefulWidget {
  MinePhotoPage({this.uploadData});

  var uploadData;

  @override
  State<StatefulWidget> createState() {
    return _MinePhotoPageState();
  }
}

class _MinePhotoPageState extends State<MinePhotoPage> {
  File _imageFile;

  bool isSure = false;

  Future getImage(bool fromGallery) async {
    var imageSource = fromGallery ? ImageSource.gallery : ImageSource.camera;
    var image = await ImagePicker.pickImage(source: imageSource);
     setState(() {
       _imageFile = image;
       isSure = true;
     });
//    _cropImage(image);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<Null> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    setState(() {
      _imageFile = croppedFile;
      isSure = true;
    });
  }
  dynamic getBody() {
    if (_imageFile == null) {
      return widget.uploadData == ''
          ? Image.asset('images/beauty.jpg', height: 260, fit: BoxFit.fill)
          : new Image.network(widget.uploadData, height: 260, fit: BoxFit.fill);
    } else {
      return Image.file(_imageFile, height: 260);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "修改头像",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(isSure);
            },
          ),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.only(bottom: 20),
                padding: new EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: new Border.all(width: 2, color: Colors.grey),
                ),
                child: new AspectRatio(
                  aspectRatio: 1,
                  child: new FittedBox(
                    fit: BoxFit.fill,
                    child: getBody(),
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: OutlineButton(
                  onPressed: () {getImage(false);},
                  child: Text("拍摄"),
                  highlightColor: Colors.redAccent.withOpacity(0.1),
                  splashColor: Colors.redAccent.withOpacity(0.3),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: OutlineButton(
                  onPressed: () {getImage(true);},
                  child: Text("从相册选取"),
                  highlightColor: Colors.redAccent.withOpacity(0.1),
                  splashColor: Colors.redAccent.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ));
  }
}
