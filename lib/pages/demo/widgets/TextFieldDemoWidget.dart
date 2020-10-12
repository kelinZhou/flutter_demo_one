import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/toast.dart';

class TextFieldDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldDemoWidgetState();
  }
}

class _TextFieldDemoWidgetState extends State<TextFieldDemoWidget> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '这是初始值');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '普通的文本输入框'
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: '请输入内容'),
        ),
        SizedBox(height: 12),
        TextField(
          maxLines: 4,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: '多行文本框'),
        ),
        SizedBox(height: 12),
        TextField(
          obscureText: true,
          obscuringCharacter: '*',
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: '密码框', labelText: '登录密码', icon: Icon(Icons.vpn_key)),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: '演示默认赋值'),
              ),
            ),
            SizedBox(width: 12),
            Container(
              height: 60,
              child: RaisedButton(
                child: Text('获取左边的内容'),
                onPressed: ()=> Toast.show(context, this._textController.text),
              ),
            )
          ],
        )
      ],
    );
  }
}
