import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

import 'image_preview_page.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  List<String> urls = List.generate(33, (index) => "images/$index.jpg");

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "GridView",
      body: GridView.builder(
        itemCount: urls.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 160, //通过约定最大宽度的方式约定每行的个数可以解决大屏适配问题。
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewPage(urls[index]))),
            child: Hero(
              tag: urls[index],
              child: Image.asset(
                urls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
