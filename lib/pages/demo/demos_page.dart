import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/pages/demo/custom_painter_page.dart';
import 'package:flutter_demo_one/pages/demo/page_view.dart';
import 'package:flutter_demo_one/pages/demo/reorderable_list_view_page.dart';
import 'package:flutter_demo_one/pages/demo/rive_flare_page.dart';
import 'package:flutter_demo_one/pages/demo/single_child_scroll_view_page.dart';
import 'package:flutter_demo_one/pages/github/git_hub_events_page.dart';

import 'grid_view_page.dart';
import 'list_wheel_scroll_view_page.dart';

class DemosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DemoItemWidget(
          name: "网络请求，Json综合演示",
          onTap: () => push(context, GitHubEventsPage()),
        ),
        DemoItemWidget(
          name: "CustomPainter",
          onTap: () => push(context, CustomPainterPage()),
        ),
        DemoItemWidget(
          name: "Rive/Flare",
          onTap: () => push(context, RiveFlarePage()),
        ),
        DemoItemWidget(
          name: "GridView",
          onTap: () => push(context, GridViewPage()),
        ),
        DemoItemWidget(
          name: "ListWheelScrollView",
          onTap: () => push(context, ListWheelScrollViewPage()),
        ),
        DemoItemWidget(
          name: "PageView",
          onTap: () => push(context, PageViewPage()),
        ),
        DemoItemWidget(
          name: "ReorderableListView",
          onTap: () => push(context, ReorderAbleListViewPage()),
        ),
        DemoItemWidget(
          name: "SingleChildScrollView",
          onTap: () => push(context, SingleChildScrollViewPage()),
        ),
      ],
    );
  }

  Future<T> push<T extends Object>(BuildContext context, Widget target) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => target));
  }
}


class DemoItemWidget extends StatelessWidget {

  final String name;
  final VoidCallback onTap;

  DemoItemWidget({this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue[500],
        child: Container(
          height: 60,
          child: Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 16),
              )),
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
