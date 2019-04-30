import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';

class StepperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StepperPage();
  }
}

class _StepperPage extends State<StepperPage> {
  var _currentStep=0;
  String occupation = ""; //职业

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Theme(data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
            ), child: new Stepper(
              currentStep: _currentStep,
              onStepTapped: (int value){
                setState(() {
                  _currentStep=value;
                });
              },
              onStepContinue: (){
                setState(() {
                  _currentStep<2?_currentStep+=1:_currentStep=0;
                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStep>0?_currentStep-=1:_currentStep=0;
                });
              },
              steps: [
              new Step(
                  title: Text("Login"),
                  subtitle: Text("Login first"),
                  content: Text("The plugin adds a random text generator, capable of creating witty texts in different genres."
                      " Created text can be inserted newly at the caret, or replace a selection"),
                isActive: _currentStep==0,
              ),
              new Step(
                title: Text("Chonse Plan"),
                subtitle: Text("Login first"),
                content: Text("The plugin adds a random text generator, capable of creating witty texts in different genres."),
                isActive: _currentStep==1,
              ),
              new Step(
                title: Text("Comfim Payment"),
                subtitle: Text("Login first"),
                content: Text(" Created text can be inserted newly at the caret, or replace a selection"),
                isActive: _currentStep==2,
              ),
            ],),),
            getPro(),
          ],
        ),
      ),
    );
  }

  getPro() {
    return new InkWell(
      onTap: () async {
        print("--->");

        return new Picker(
            adapter: PickerDataAdapter<String>(
                pickerdata: new JsonDecoder().convert(PickerData)),
            changeToFirst: true,
            hideHeader: false,
            textStyle: TextStyle(color: Colors.black87,fontSize: 18.0),
            cancelText: '取消',
            confirmText: '确定',
            onConfirm: (Picker picker, List value) {
              // print(value.toString());
              // print(picker.adapter.text);
              List result = picker.adapter.getSelectedValues();
              setState(() {
                // occupation = result[0].toString() +
                //     result[1].toString() +
                //     result[2].toString();
                occupation = result[2].toString();
              });
            }).showModal(this.context);
      },
      child: new Container(
        height: 50,
        child: new Row(
          children: <Widget>[
            new Container(
              child: Text(
                "职业信息",
                style: TextStyle(fontSize: 15),
              ),
              margin: EdgeInsets.only(left: 10),
            ),
            new Container(
              child: Expanded(
                  child: Text(
                    '$occupation',
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
}
const PickerData = '''
[
  {"计算机/互联网/通信/电子": [
    {
      "计算机硬件": [
        "高级硬件工程师",
        "硬件工程师",
        "其他"
      ]
    },
    {
      "计算机软件": ["4"]
    },
    {
      "硬件工程师": [
          9,
          10,
          11,
          12
      ]
    }
  ]},
  {"销售/客服/技术支持": [
    {
      "销售": [
          11,
          22,
          33,
          44
      ]
    },
    {
      "客服": [
          55,
          66,
          77,
          88
      ]
    },
    {
      "技术支持": [
          99,
          1010,
          1111,
          1212
      ]
    }
  ]},
  {"会计/金融/银行/保险": [
    {
      "会计": [
          "a",
          "b",
          "c"
      ]
    },
    {
      "金融": [
          "aa",
          "bb",
          "cc"
      ]
    },
    {
      "银行": [
          "aaa",
          "bbb",
          "ccc"
      ]
    },
    {
      "保险": [
          "aaa",
          "bbb",
          "ccc"
      ]
    }
  ]}
]
    ''';
