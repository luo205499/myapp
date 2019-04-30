import 'package:flutter/material.dart';

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;
  bool autovalidate=false;

  // 提交
  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _showMessage('用户名是：$_name，密码是：$_password');
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("正在登录...")));
    }else{
      setState(() {
        autovalidate=true;
      });
    }
  }

  // 展示提示框
  void _showMessage(String val) {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,//必须点击取消或者确定关闭提示框
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('提示'),
          content: Text('$val'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _formKey.currentState.reset();
                Navigator.pop(context);
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  String validatorUsername(value){
    if(value.isEmpty){
      return "用户名不能为空";
    }
  return null;
  }

  String validatorPassword(value){
    if(value.isEmpty){
      return "密码不能为空";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "用户名",helperText: ''),
              onSaved: (value) {
                _name = value;
              },
              validator: validatorUsername,
              autovalidate: autovalidate,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "密码",helperText: ''),
              onSaved: (value) {
                _password = value;
              },
              validator: validatorPassword,
              autovalidate: autovalidate,
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: _onSubmit,
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}
