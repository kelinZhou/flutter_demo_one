import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class PageViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "PageView",
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPage("1", Colors.green[300]),
                _buildPage("2", Colors.pink[200]),
                _buildPage("3", Colors.blue[200]),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                _buildPage("1", Colors.red[300]),
                _buildPage("2", Colors.black12),
                _buildPage("3", Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: PageView(
              pageSnapping: false,
              children: [
                _buildPage("1", Colors.red[400]),
                _buildPage("2", Colors.blueAccent),
                _buildPage("3", Colors.lightGreen),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildPage(String text, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
