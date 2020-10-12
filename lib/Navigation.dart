import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_one/model/hospital.dart';

class Navigation{

  ///跳转到医院详情页面。
  static jumpToHospitalDetail(BuildContext context, Hospital data) {
    Navigator.pushNamed(context, '/hospitalDetail', arguments: data);

    // Navigator.push(context, MaterialPageRoute(
    //   builder:(context){
    //     return SecondPage(title: '第二个页面',);
    //   }
    // ));
  }
}

class SecondPage extends StatelessWidget{

  final String title;
  SecondPage({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Text("我是${this.title}"),
      ),
    );
  }
}