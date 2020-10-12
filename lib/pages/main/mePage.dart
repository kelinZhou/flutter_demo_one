import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:flutter_demo_one/pages/demo/widgets/ButtonsDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/CheckBoxDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/DateTimeDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/DialogDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/HttpDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/SweiperDemoWidget.dart';
import 'package:flutter_demo_one/pages/demo/widgets/TextFieldDemoWidget.dart';

AppbarTabController createMeTabControllerBuilder(BuildContext context) {
  return AppbarTabController(isScrollable: true, tabs: [
    TabContainer(
        tabName: '替换路由',
        child: Align(
          alignment: Alignment.center,
          child: RaisedButton(
            child: Text('打开第二个页面'),
            onPressed: () => Navigator.pushNamed(context, '/testPage'),
          ),
        )),
    TabContainer(
        tabName: 'TabController',
        child: Align(
          alignment: Alignment.center,
          child: RaisedButton(
            child: Text('TabController的高级用法'),
            onPressed: () => Navigator.pushNamed(context, '/superiorTabController'),
          ),
        )),
    TabContainer(
        tabName: 'Drawer',
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('配合DrawerHeader使用'),
                onPressed: () => Navigator.pushNamed(context, '/drawer/drawerHeader'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('配合UserAccountsDrawerHeader使用'),
                onPressed: () => Navigator.pushNamed(context, '/drawer/userAccountsDrawerHeaderPage'),
              ),
            ],
          ),
        )),
    TabContainer(
        tabName: 'Buttons',
        child: ButtonsDemoWidget()
    ),
    TabContainer(
        tabName: 'TextField',
        child: TextFieldDemoWidget()
    ),
    TabContainer(
        tabName: 'CheckBox&Radio&Switch',
        child: CheckBoxDemoWidget()
    ),
    TabContainer(
        tabName: '日期&时间',
        child: DateTimeDemoWidget()
    ),
    TabContainer(
        tabName: '轮播图',
        child: BannerDemoWidget()
    ),
    TabContainer(
        tabName: 'Json Map互转',
        child: HttpDemoWidget()
    )
  ]);
}