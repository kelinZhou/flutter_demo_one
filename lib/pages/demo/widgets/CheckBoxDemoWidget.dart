import 'package:flutter/material.dart';

class CheckBoxDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxDemoWidget();
  }
}

class _CheckBoxDemoWidget extends State<CheckBoxDemoWidget> {
  var _isChecked = false;

  var _tags = ['第一个', '第二个', '第三个'];
  var _currentTagIndex = 0;

  var _switch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: this._isChecked,
              onChanged: (v) {
                setState(() {
                  this._isChecked = v;
                });
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(this._isChecked ? '已选中' : '未选中')],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              onChanged: (v) {
                setState(() {
                  this._currentTagIndex = v;
                });
              },
              groupValue: this._currentTagIndex,
            ),
            Text(this._tags[0]),
            SizedBox(width: 10),
            Radio(
              value: 1,
              onChanged: (v) {
                setState(() {
                  this._currentTagIndex = v;
                });
              },
              groupValue: this._currentTagIndex,
            ),
            Text(this._tags[1]),
            SizedBox(width: 10),
            Radio(
              value: 2,
              onChanged: (v) {
                setState(() {
                  this._currentTagIndex = v;
                });
              },
              groupValue: this._currentTagIndex,
            ),
            Text(this._tags[2]),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('当前选中的是：${this._tags[this._currentTagIndex]}')],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: this._switch,
              onChanged: (v) => setState(() => this._switch = v),
            )
          ],
        )
      ],
    );
  }
}
