import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              FlutterLogo(size: 300),
              FlutterLogo(size: 300),
            ],
          ),
        ),
      ),
    );
  }
}
