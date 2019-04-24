import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonPage();
  }
}

class _ButtonPage extends State<ButtonPage> {
  String _currentMenuItem="Home";
  @override
  Widget build(BuildContext context) {
    Widget flateButtonDemo = new Row(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Button"),
          textColor: Colors.blueAccent,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          splashColor: Colors.blueAccent,
        ),
      ],
    );
    Widget raisedButtonDemo = new Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text("Button"),
          textColor: Colors.blueAccent,
        ),
        SizedBox(
          width: 32.0,
        ),
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          splashColor: Colors.blueAccent,
          elevation: 12.0,
        ),
      ],
    );
    Widget outlineButtonDemo = new Row(
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text("Button"),
          textColor: Colors.blueAccent,
        ),
        SizedBox(
          width: 32.0,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          splashColor: Colors.blueAccent[100],
          highlightColor: Colors.blue,
          borderSide: BorderSide(width: 1.0, color: Colors.black),
        ),
      ],
    );
    Widget expandedButtonDemo = new Row(
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text("Button"),
            textColor: Colors.blueAccent,
          ),
        ),
        SizedBox(
          width: 32.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text("Button"),
            splashColor: Colors.blueAccent[100],
            borderSide: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
      ],
    );
    Widget popupMenuButtonDemo = new Row(children: <Widget>[
      Text(_currentMenuItem),
      PopupMenuButton(
        onSelected: (value) {
          setState(() {
            _currentMenuItem=value;
          });
        },
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text("Home"),value: "Home",
              ),
              PopupMenuItem(
                child: Text("Discover"),value: "Discover",
              ),
              PopupMenuItem(
                child: Text("Comuntiy"),value: "Comuntiy",
              ),
            ],
      )
    ]);

    return new Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flateButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            expandedButtonDemo,
            popupMenuButtonDemo,
          ],
        ),
      ),
    );
  }
}
