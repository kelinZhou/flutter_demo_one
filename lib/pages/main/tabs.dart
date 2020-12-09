import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:flutter_demo_one/common/toast.dart';
import 'package:flutter_demo_one/pages/main/demos_page.dart';
import 'package:flutter_demo_one/pages/main/mePage.dart';

import 'homePage.dart';
import 'hospitalListPage.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 1;
  List<_Tab> pages = [
    _Tab(Icons.home, '首页', HomePage()),
    _Tab(Icons.accessible, 'Demo', DemosPage()),
    _Tab(Icons.person, '我的', null)
  ];

  _Tab get _currentTab {
    return this.pages[this._currentIndex];
  }

  List<Widget> get _optionMenus {
    if (this._currentIndex == 0) {
      return [
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: () {
            Toast.show(context, '您点击了搜索按钮！');
          },
        )
      ];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: this._currentIndex == 2 ? 'Demos' : _currentTab.pageName,
      body: pages[this._currentIndex].page,
      menus: _optionMenus,
      tabControllerBuilder: this._currentIndex == 2
          ? createMeTabControllerBuilder(context)
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: pages.map((p) {
          return BottomNavigationBarItem(icon: p.icon, title: Text(p.pageName));
        }).toList(),
      ),
    );
  }
}

class _Tab {
  Icon icon;
  final String pageName;
  final Widget page;

  _Tab(IconData icon, this.pageName, this.page) {
    this.icon = Icon(icon);
  }
}
