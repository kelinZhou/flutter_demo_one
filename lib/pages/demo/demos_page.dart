import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/pages/demo/custom_painter_page.dart';
import 'package:flutter_demo_one/pages/demo/rive_flare_page.dart';

import 'grid_view_page.dart';

class DemosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
      ],
    );
  }

  Future<T> push<T extends Object>(BuildContext context, Widget target) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => target));
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
