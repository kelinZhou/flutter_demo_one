import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class ImagePreviewPage extends StatefulWidget {
  final String _url;

  ImagePreviewPage(this._url);

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {

  @override
  void initState() {
    timeDilation = 2;
    super.initState();
  }

  @override
  void dispose() {
    timeDilation = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "图片预览",
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Hero(
                tag: widget._url,
                child: Image.asset(
                  widget._url,
                )),
          ),
        ),
      ),
    );
  }
}
