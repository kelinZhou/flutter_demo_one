import 'package:flutter/material.dart';

class SuperiorTabControllerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SuperiorTabControllerPageState();
  }
}

class _SuperiorTabControllerPageState extends State<SuperiorTabControllerPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this  //1.固定写法
    );
    _tabController.addListener(() {
      print(this._tabController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabController的高级用法'),
        bottom: TabBar(
          controller: this._tabController,  //2.TabBar必须设置自己定义的TabController
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: '科幻'),
            Tab(text: '悬疑')
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,  //3.TabBarView必须设置自己定义的TabController
        children: [
          Center(
            child: Text('科幻'),
          ),
          Center(
            child: Text('悬疑'),
          ),
        ],
      ),
    );
  }
}
