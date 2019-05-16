import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/view/mine/MinePhotoPage.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:city_pickers/city_pickers.dart';

class MineInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineInfoPageState();
  }
}

class _MineInfoPageState extends State<MineInfoPage> {
  String username = "小雅";
  int age=18;
  String sex="女";
  String address = ""; //地址
  String _result; //地址完整信息

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
        title: Text(
          "个人信息",
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
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            getUserPhoto(),
            getUsername(),
            getAge(),
            getSex(),
            getPhone(),
            SizedBox(
              height: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.redAccent.withOpacity(0.1),
                ),
              ),
            ),
            getPro(),
            getAddress(),
          ],
        ),
      ),
    );
  }

  setInkWell(firstText, secondText, callback) {
    return new InkWell(
      onTap: callback,
      child: new Container(
        height: 50,
        margin: EdgeInsets.only(right: 2.0),
        child: new Row(
          children: <Widget>[
            new Container(
              child: Text(
                secondText,
                style: TextStyle(fontSize: 16.0),
              ),
              margin: EdgeInsets.only(left: 10),
            ),
            new Container(
              child: Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: firstText,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.0,
                      color: Colors.grey.withOpacity(0.6),
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

  //获取用户头像
  getUserPhoto() {
    return setInkWell(
        Image.network(
          "http://g.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e770bd00d868ba61ea9d345f2.jpg",
          height: 35.0,
          width: 35.0,
          fit: BoxFit.cover,
        ),
        '头像', () async {
      final result = await Navigator.of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) {
        return new MinePhotoPage(
            uploadData:
                "http://g.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e770bd00d868ba61ea9d345f2.jpg");
      }));
      if (result == true) {
        print("刷新");
      }
    });
  }
  //获取用户名
  getUsername() {
    return setInkWell(
        Text(
          username,
          style: TextStyle(fontSize: 16.0),
        ),
        "昵称", () {
      updateUsername(username);
    });
  }
  //获取年龄
  getAge() {
    return setInkWell(
        Text(
          "${age}",
          style: TextStyle(fontSize: 16.0),
        ),
        "年龄",
        () {updateAge(context);});
  }
  //获取性别
  getSex() {
    return setInkWell(
        Text(
          sex,
          style: TextStyle(fontSize: 16.0),
        ),
        "性别",
        () {updateSex();});
  }
  //获取职业
  getPro() {
    return setInkWell(
        Text(
          "无",
          style: TextStyle(fontSize: 16.0),
        ),
        "行业",
        () {});
  }
  //获取电话号码
  getPhone() {
    return setInkWell(
        Text(
          "152****2323",
          style: TextStyle(fontSize: 16.0),
        ),
        "注册号码",
        () {});
  }
  //获取住址
  getAddress() {
    return new InkWell(
      onTap: () async {
        Result result = await CityPickers.showFullPageCityPicker(
          context: context,
          locationCode: _result != '' && _result != null
              ? (json.decode(_result)['areaId'] == null
              ? (json.decode(_result)['cityId'] == null
              ? (json.decode(_result)['provinceId'] == null
              ? '500000'
              : json.decode(_result)['provinceId'])
              : json.decode(_result)['cityId'])
              : json.decode(_result)['areaId'])
              : '500000',
        );
        if (result != null) {
          updateRegion(result);
        }
      },
      child: new Container(
        height: 50,
        child: new Row(
          children: <Widget>[
            new Container(
              child: Text(
                "常用地址",
                style: TextStyle(fontSize: 15),
              ),
              margin: EdgeInsets.only(left: 10),
            ),
            new Container(
              child: Expanded(
                  child: Text(
                    "$address",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.end,
                  )),
            ),
            new Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Image.asset("images/next.png"),
            )
          ],
        ),
      ),
    );
  }
  //修改用户名
  updateUsername(name) async {
    var _nickNameController = new TextEditingController();
    _nickNameController = TextEditingController.fromValue(
        TextEditingValue(text: (name == '未填写' ? '' : name)));
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Row(children: <Widget>[
            Icon(Icons.announcement),
            Text("修改昵称"),
            ],),
            content: TextField(
              controller: _nickNameController,
              keyboardType: TextInputType.text,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      username = _nickNameController.text;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("确认")),
            ],
          );
        });
  }
  //修改年龄
  updateAge(context){
    List<int> pkArray = [];
    for (int i = 0; i < 100; i++) {
      pkArray.add(i);
    }
    var pickerData = '''$pkArray ''';
    Picker picker = new Picker(
        cancelText: '取消',
        cancelTextStyle: TextStyle(color: Colors.black87),
        confirmText: '确定',
        confirmTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        selecteds: [age],
        adapter: PickerDataAdapter<String>(
            pickerdata: new JsonDecoder().convert(pickerData)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
            setState(() {   age = value[0];});
        });
    picker.showModal(context);
    return picker;
  }
  //修改性别
  updateSex(){
      showModalBottomSheet(
          context: context,
          builder: (builder){
            return new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.person,color: Colors.blue,),
                  title: new Text("男"),
                  onTap: () async {
                   setState(() {
                     sex="男";
                   });
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.person,color: Colors.red),
                  title: new Text("女"),
                  onTap: () async {
                    setState(() {
                      sex="女";
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
      );
  }
  //修改地址
  void updateRegion(data) async {
    var dataStr = '${data.toString()}';
    print(dataStr);
//    var result =
//    await NetUtils.post(api['updateRegion'], params: {'address': dataStr});
//    print(result);
//    var _resultData = json.decode(result);
    if (/*_resultData['code']*/ 200== 200) {
      _result = dataStr;
      address = "${data.provinceName}" +
          "${data.cityName == null ? '' : data.cityName}" +
          "${data.areaName == null ? '' : data.areaName}";
      setState(() {});
    }
  }
}
