import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class TestPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return PageRoot(
        title: '演示路由替换功能',
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('打开第三个页面'),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/testPage2', arguments: '演示路由替换并传参');
                },
              )
            ],
          ),
        )
    );
  }
}