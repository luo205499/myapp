import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationPage();
  }


}

class _BottomNavigationPage extends State<BottomNavigationPage>{
  var _currentIndex=0;
  void _onTapHeader(int index) {
      setState(() {
        _currentIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.explore), title: Text("explore")),
      BottomNavigationBarItem(
          icon: Icon(Icons.history), title: Text("History")),
      BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
      BottomNavigationBarItem(
          icon: Icon(Icons.speaker), title: Text("Speaker")),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text("Person")),
    ],currentIndex: _currentIndex,
      onTap: _onTapHeader,
    );
  }
}