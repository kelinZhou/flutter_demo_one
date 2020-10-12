import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/toast.dart';
import 'package:http/http.dart';

class HttpDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpDemoWidget();
  }
}

class _HttpDemoWidget extends State<HttpDemoWidget> {
  final String _json = '{"username":"张三","age":23}';
  final Map _map = {"username": "张三", "age": 23};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_json),
        SizedBox(height: 12),
        RaisedButton(
          child: Text('json转map'),
          onPressed: () {
            Toast.show(context, json.decode(_json)['username']);
          },
        ),
        SizedBox(height: 10),
        RaisedButton(
          child: Text('map转json'),
          onPressed: () {
            Toast.show(context, json.encode(_map));
          },
        ),
        SizedBox(height: 10),
        RaisedButton(
          child: Text('get请求'),
          onPressed: () {
            _onGetData(context);
          },
        ),
        SizedBox(height: 10),
        RaisedButton(
          child: Text('post请求'),
          onPressed: () {
            _doLogin(context, 'user', 'psw');
          },
        )
      ],
    );
  }

  _onGetData(context, {url = ''}) async {
    var result = await get(url);
    if (result.statusCode == 200) {
      Toast.show(context, result.body);
    } else {
      Toast.show(context, '接口请求错误！');
    }
  }

  _doLogin(context, username, psw, {url = ''}) async {
    var result = await post(url, body: {'username':username, 'psw':psw});
    if (result.statusCode == 200) {
      print(result.body);
    } else {
      print('接口请求错误！');
    }
  }
}
