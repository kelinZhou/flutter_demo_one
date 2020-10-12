import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class TestPage2 extends StatelessWidget{
  final String title;
  const TestPage2(this.title);

  @override
  Widget build(BuildContext context) {
    return PageRoot(
        title: title,
        body: Align(
          alignment: Alignment.center,
          child: RaisedButton(
            child: Text('回到第一个页面'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
    );
  }
}