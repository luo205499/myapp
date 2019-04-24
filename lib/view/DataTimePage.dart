import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';

class DataTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataTimePage();
  }
}

class _DataTimePage extends State<DataTimePage> {
  DateTime selectData = DateTime.now();
  TimeOfDay selectTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectData,
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));
    if (date == null) {
      return;
    }
    setState(() {
      selectData = date;
    });
  }

 Future<void> _selectTime() async {
    final TimeOfDay time =
        await showTimePicker(context: context, initialTime: selectTime);
    if (time == null) {
      return;
    }
    setState(() {
      selectTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: new Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectData)),
                      new Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                SizedBox(width: 32.0,),
                InkWell(
                  onTap: _selectTime,
                  child: new Row(
                    children: <Widget>[
                      Text(selectTime.format(context)),
                      new Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
