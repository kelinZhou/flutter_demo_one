import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailPage extends StatelessWidget {
  final data;

  List<String> get _movies {
    return data['movies'];
  }

  int get _index {
    return data['index'];
  }

  MovieDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 1.要实现Android中的TabLayout需要使用DefaultTabController组件。
      initialIndex: this._index,
      length: _movies.length,
      child: Scaffold(
        // 2.使用Scaffold作为DefaultTabController组件的child。
        appBar: AppBar(
          // 3.设置appBar。
          title: Text('电影专区'),
          centerTitle: true,
          bottom: TabBar(
              // 4.设置bottom属性为TabBar组件。
              isScrollable: true,  // 5.如果tab过多时需要将isScrollable属性设置为true，否者无法显示。默认为false。
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: _movies
                  .map((movie) => Tab(text: movie))
                  .toList() // 6.设置tab的样式，建议使用Tab组件。
              ),
        ),
        body: TabBarView( // 7.设置body属性为TabBarView组件。
          children: _movies.map((movie) {
            // 8.为TabBarView设置每个页面的具体内容(绘制每个页面)。
            return Align(
                alignment: Alignment.center, child: Text('电影《$movie》的详情页面。'));
          }).toList(),
        ),
      ),
    );
  }
}
