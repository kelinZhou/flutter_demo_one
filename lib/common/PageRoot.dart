import 'package:flutter/material.dart';

class PageRoot extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> menus;
  final Widget drawer;
  final BottomNavigationBar bottomNavigationBar;
  final AppbarTabController tabControllerBuilder;
  final FloatingActionButtonBuilder floatingActionButton;


  const PageRoot({@required this.title,
    this.body,
    this.menus = const <Widget>[],
    this.drawer,
    this.bottomNavigationBar,
    this.tabControllerBuilder,
    this.floatingActionButton
  }) : assert(body != null || tabControllerBuilder != null);

  bool get _hasTabController {
    return tabControllerBuilder != null;
  }

  @override
  Widget build(BuildContext context) {
    if (this.tabControllerBuilder == null) {
      return _createRoot();
    } else {
      return DefaultTabController(
        length: tabControllerBuilder.tabs.length,
        child: _createRoot(),
      );
    }
  }

  Widget _createRoot() {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
        actions: menus,
        bottom: !_hasTabController
            ? null
            : TabBar(
          isScrollable: tabControllerBuilder.isScrollable,
          tabs: tabControllerBuilder.tabs
              .map((v) => Tab(text: v.tabName))
              .toList(),
        ),
      ),
      bottomNavigationBar: this.bottomNavigationBar,
      body: _hasTabController
          ? TabBarView(
          children: tabControllerBuilder.tabs.map((v) => v.child).toList())
          : this.body,
      drawer: this.drawer,
      floatingActionButton: this.floatingActionButton?._flatActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AppbarTabController {
  final bool isScrollable;
  final List<TabContainer> tabs;

  const AppbarTabController(
      {this.isScrollable = false, this.tabs = const <TabContainer>[]})
      : assert(tabs != null, '');
}

class TabContainer {
  final String tabName;
  final Widget child;

  const TabContainer({@required this.tabName, @required this.child});
}


class FloatingActionButtonBuilder {
  final IconData icon;
  final Color color;
  final double size;
  final FloatingActionButtonLocation location;
  final VoidCallback onPressed;
  final Decoration decoration;
  final double padding;
  final double elevation;
  final EdgeInsetsGeometry margin;

  FloatingActionButtonBuilder(
      {this.icon, this.color, this.size, this.location, this.elevation, this.onPressed, this.decoration, this.padding, this.margin});


  Widget get _flatActionButton {
    return Container(
      margin: this.margin,
      width: this.size,
      height: this.size,
      padding: EdgeInsets.all(this.padding),
      decoration: this.decoration,
      child: FloatingActionButton(
        backgroundColor: this.color,
        elevation: this.elevation,
        child: Icon(this.icon),
        onPressed: this.onPressed,
      ),
    );
  }
}
