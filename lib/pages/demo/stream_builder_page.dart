import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {

  //下面的Stream只能同时被一个人监听，如果需要多人监听则需要使用StreamController.broadcast()（广播）的方式。
  //只不过广播的方式不会保留状态，即在被监听之前所添加的事件是不能被监听到的。只能监听到添加监听之后所发生的事件。
  StreamController _controller = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "Stream&StreamBuilder",
      body: Column(
        children: [
          Wrap(
            children: [
              RaisedButton(
                child: Text("发送随机数"),
                onPressed: () {
                  if (!_controller.isClosed) {
                    _controller.add(Random().nextInt(100));
                  }
                },
              ),
              RaisedButton(
                child: Text("发送 Hi"),
                onPressed: () {
                  if (!_controller.isClosed) {
                    _controller.add("Hi");
                  }
                },
              ),
              RaisedButton(
                child: Text("发送Error"),
                onPressed: () {
                  if (!_controller.isClosed) {
                    _controller.sink.addError("error");
                  }
                },
              ),
              RaisedButton(
                child: Text("关闭Stream"),
                onPressed: () {
                  _controller.close();
                },
              )
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headline4,
                child: StreamBuilder(
                  stream: _controller.stream
                      /*.distinct() //去重
                      .where((event) => true)//过滤
                      .map((event) => event * 2)*/, //事件转换
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("NONE:没有Stream");
                        break;
                      case ConnectionState.waiting:
                        return Text("WAITING:等待中...");
                        break;
                      case ConnectionState.active:
                        if (snapshot.hasError) {
                          return Text("ERROR:错误${snapshot.error}");
                        } else {
                          return Text("ACTIVE:数据是${snapshot.data}");
                        }
                        break;
                      case ConnectionState.done:
                        return Text("DONE:Stream已经关闭");
                        break;
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
