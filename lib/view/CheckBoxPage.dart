import 'package:flutter/material.dart';

void main() => runApp(new CheckBoxPage());

class CheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxPageState();
  }
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _checkBoxItemA = false;
  int _radioGroupA = 0;
  bool _checkBoxItemA2 = false;
  int _radioGroupA2 = 0;
  bool _switchItemA2 = false;
  bool _switchItemA = false;
  List<String> _selected=[];

  List<String> tabs = ['apple', 'bananer', 'lemon'];

  var _sliderItemA = 0.0;

  String action='Nothing';

  String _choice="lemon";

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioGroupA2 = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      new ListView(children: <Widget>[
        new Checkbox(
            value: _checkBoxItemA2,
            onChanged: (value) {
              setState(() {
                _checkBoxItemA2 = value;
              });
            }),
        new CheckboxListTile(
          value: _checkBoxItemA,
          onChanged: (value) {
            setState(() {
              _checkBoxItemA = value;
            });
          },
          title: Text("checkBoxItemA"),
          subtitle: Text("Description"),
          secondary: Icon(Icons.bookmark),
          selected: _checkBoxItemA,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("Radio"),
            new Radio(
              value: 0,
              groupValue: _radioGroupA2,
              onChanged: _handleRadioValueChange2,
              activeColor: Colors.lightBlue,
            ),
            new Radio(
              value: 1,
              groupValue: _radioGroupA2,
              onChanged: _handleRadioValueChange2,
              activeColor: Colors.lightBlue,
            ),
          ],
        ),
        new RadioListTile(
          value: 0,
          groupValue: _radioGroupA,
          onChanged: _handleRadioValueChange,
          title: Text("Options A"),
          subtitle: Text("Description"),
          secondary: Icon(Icons.filter_1),
          selected: _radioGroupA == 0,
        ),
        new RadioListTile(
          value: 1,
          groupValue: _radioGroupA,
          onChanged: _handleRadioValueChange,
          title: Text("Options B"),
          subtitle: Text("Description"),
          secondary: Icon(Icons.filter_2),
          selected: _radioGroupA == 1,
        ),
        new Row(
          children: <Widget>[
            Text(_switchItemA2 ? '关闭' : '打开'),
            Switch(
              value: _switchItemA2,
              onChanged: (value) {
                setState(() {
                  _switchItemA2 = value;
                });
              },
              activeColor: Colors.red,
            ),
          ],
        ),
        new SwitchListTile(
          value: _switchItemA,
          onChanged: (value) {
            setState(() {
              _switchItemA = value;
            });
          },
          title: Text("Switch Item A"),
          subtitle: Text("Description"),
          secondary:
              Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
          selected: _switchItemA,
        ),
        new Slider(
          value: _sliderItemA,
          onChanged: (value) {
            setState(() {
              _sliderItemA = value;
            });
          },
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: '${_sliderItemA.toInt()}',
        ),
        new Wrap(
          spacing: 6.0,
          children: <Widget>[
            Chip(
              label: Text("Helo"),
              backgroundColor: Colors.orange,
            ),
            Chip(
              label: Text("Tom"),
              avatar: CircleAvatar(
                child: Text("Tic"),
                backgroundColor: Colors.grey,
              ),
            ),
            Chip(
              label: Text("Tom"),
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://119.23.51.242:8080/images/1555577867108_IMG_2765.JPG"),
              ),
            ),
            Chip(
              label: Text("City"),
              onDeleted: () {},
              deleteIcon: Icon(Icons.delete),
              deleteIconColor: Colors.red,
              deleteButtonTooltipMessage: "Remove City",
              backgroundColor: Colors.blue,
            ),
            new Wrap(
              spacing: 8.0,
              children: tabs.map((tab) {
                return Chip(
                  label: Text(tab),
                  onDeleted: () {
                    setState(() {
                      tabs.remove(tab);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
        new Divider(
          color: Colors.green,
          height: 32.0,
          indent: 32.0,
        ),
        new Container(
          child: Text("Action is ${action}"),
        ),
        new Wrap(
          spacing: 8.0,
          children: tabs.map((tab) {
            return ActionChip(
              label: Text(tab),
              onPressed: () {
                setState(() {
                  action=(tab);
                });
              },
            );
          }).toList(),
        ),
        new Divider(
          color: Colors.blue,
          height: 32.0,
          indent: 32.0,
        ),
        new Container(
          child: Text("FilterChip is ${_selected.toString()}"),
        ),
        new Wrap(
          spacing: 8.0,
          children: tabs.map((tab) {
            return FilterChip(
              label: Text(tab),
             selected: _selected.contains(tab),
             onSelected: (value){
                setState(() {
                  if(_selected.contains(tab)){
                    _selected.remove(tab);
                  }else{
                    _selected.add(tab);
                  }
                });
             },
            );
          }).toList(),
        ),
        new Divider(
          color: Colors.blue,
          height: 32.0,
          indent: 32.0,
        ),
        new Container(
          child: Text("Choice is ${_choice}"),
        ),
        new Wrap(
          spacing: 8.0,
          children: tabs.map((tab) {
            return ChoiceChip(
              label: Text(tab),
              selected: _choice == tab,
              selectedColor: Colors.black,
              onSelected: (value){
                setState(() {
                  _choice = value ? tab : null;
                });
              },
            );
          }).toList(),
        ),

      ]),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tabs=['apple','bananer','lemon'];

            _selected=[];
            _choice="lemon";
          });
        },
        child: Icon(Icons.restore),
      ),
//      ),
    );
  }
}
