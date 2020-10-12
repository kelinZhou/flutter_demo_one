import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:flutter_demo_one/common/toast.dart';
import 'package:flutter_demo_one/model/hospital.dart';

class HospitalDetailPage extends StatefulWidget {
  final Hospital data;

  HospitalDetailPage(this.data);

  @override
  State<StatefulWidget> createState() {
    return _HospitalDetailPageState(this.data);
  }
}

class _HospitalDetailPageState extends State<HospitalDetailPage>{
  final Hospital data;

  _HospitalDetailPageState(this.data);

  @override
  Widget build(BuildContext context) {
    return PageRoot(
        title: this.data.name,
        menus: [
          IconButton(
              icon: Icon(
                  data.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  data.isFavorite = !data.isFavorite;
                  if(data.isFavorite) {
                    Toast.show(context, "已收藏${this.data.name}");
                  }else {
                    Toast.show(context, "已取消收藏");
                  }
                });
              }
          )
        ],
        body: Align(
            alignment: Alignment.center,
            child: InkWell(
              child: Text("我是${this.data.name}的详情页面"),
              onTap: () {
                Navigator.pop(context);
              },
            )));
  }

}