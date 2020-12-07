import 'package:flutter/material.dart';
import 'package:flutter_demo_one/pages/demo/DrawerPage.dart';
import 'package:flutter_demo_one/pages/demo/MovieDetail.dart';
import 'package:flutter_demo_one/pages/demo/SuperiorTabController.dart';
import 'package:flutter_demo_one/pages/demo/UserAccountsDrawerHeaderPage.dart';
import 'package:flutter_demo_one/pages/demo/custom_painter_page.dart';
import 'package:flutter_demo_one/pages/hospital/hospitalDetailPage.dart';
import 'package:flutter_demo_one/pages/demo/Test.dart';
import 'package:flutter_demo_one/pages/demo/Test2.dart';

import 'pages/main/tabs.dart';

final routes = {
  '/': (context) => Tabs(),
  '/hospitalDetail': (context, {arguments}) => HospitalDetailPage(arguments),
  '/testPage': (context) => TestPage(),
  '/testPage2': (context, {arguments}) => TestPage2(arguments),
  '/movieDetail': (context, {arguments}) => MovieDetailPage(arguments),
  '/superiorTabController': (context) => SuperiorTabControllerPage(),
  '/drawer/drawerHeader': (context) => DrawerPage(),
  '/drawer/userAccountsDrawerHeaderPage': (context) => UserAccountsDrawerHeaderPage()
};

Function generateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    return MaterialPageRoute(builder: (context) {
      if (settings.arguments != null) {
        return pageContentBuilder(context, arguments: settings.arguments);
      } else {
        return pageContentBuilder(context);
      }
    });
  } else {
    throw ArgumentError('route "$name" not implements!');
  }
};
