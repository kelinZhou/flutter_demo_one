import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class StreamNumGamePage extends StatefulWidget {
  @override
  _StreamNumGamePageState createState() => _StreamNumGamePageState();
}

class _StreamNumGamePageState extends State<StreamNumGamePage> {
  int get createTarget {
    return Random().nextInt(100) + 1;
  }

  var targetNum = -1;
  var lastNum = -1;

  TextEditingController textEditController = TextEditingController();

  StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "猜数字",
      menus: [
        MaterialButton(
          child: Text(
            "开始",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (targetNum < 0) {
              setState(() {
                targetNum = createTarget;
              });
            } else {
              targetNum = createTarget;
              _streamController.add(999);
            }
          },
        )
      ],
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: StreamBuilder(
                stream: targetNum < 0
                    ? null
                    : _streamController.stream.transform(StreamTransformer<int, String>.fromHandlers(
                        handleData: (value, sink) {
                          print("$value|$targetNum");
                          if (value == -999) {
                            sink.add("重新开始一局试试吧");
                          } else if (value == 999) {
                            sink.add("继续输入一个100以内的数，猜一猜");
                          } else if (value < targetNum) {
                            sink.addError("小了");
                          } else if (value > targetNum) {
                            sink.addError("大了");
                          } else {
                            sink.add("恭喜你，答对了!");
                          }
                        },
                      )), //事件转换
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("点击右上角开始游戏");
                      break;
                    case ConnectionState.waiting:
                      return Text("输入一个100以内的数，猜一猜");
                      break;
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return Text("${snapshot.data}");
                      }
                      break;
                    case ConnectionState.done:
                      return Text("游戏已经结束了");
                      break;
                  }
                  return Container();
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "请输入一个100及以内的数", border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                RaisedButton(
                  child: Text("确定"),
                  onPressed: () {
                    if (targetNum >= 0 && textEditController.text != null && textEditController.text.isNotEmpty) {
                      var currentNum = int.parse(textEditController.text);
                      if(lastNum != targetNum) {
                        lastNum = currentNum;
                        _streamController.add(currentNum);
                        textEditController.text = "";
                      }else{
                        _streamController.add(-999);
                      }
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
