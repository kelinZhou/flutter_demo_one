import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class ListWheelScrollViewPage extends StatefulWidget {
  @override
  _ListWheelScrollViewPageState createState() => _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {
  String _currentMonth = "第0月";

  String _currentDay = "第0天";

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "ListWheelScrollView",
      body: Column(
        children: [
          Text(
            "$_currentMonth$_currentDay",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            flex: 1,
            child: RotatedBox(
              quarterTurns: 3,
              child: ListWheelScrollView(
                itemExtent: 80,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _currentMonth = "第$index月";
                  });
                },
                children: List.generate(
                    100,
                    (index) => RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "第$index月",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListWheelScrollView(
              itemExtent: 50,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  _currentDay = "第$index天";
                });
              },
              children: List.generate(
                  100,
                  (index) => Text(
                        "第$index天",
                        style: TextStyle(fontSize: 20),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
