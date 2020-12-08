import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class ReorderAbleListViewPage extends StatefulWidget {
  @override
  _ReorderAbleListViewPageState createState() => _ReorderAbleListViewPageState();
}

class _ReorderAbleListViewPageState extends State<ReorderAbleListViewPage> {
  final List<Widget> _children = [
    MyListItem(UniqueKey() ,"1", Colors.red[400]),
    MyListItem(UniqueKey() ,"2", Colors.blueAccent),
    MyListItem(UniqueKey() ,"3", Colors.purple),
    MyListItem(UniqueKey() ,"4", Colors.orange),
    MyListItem(UniqueKey() ,"5", Colors.yellow[300]),
    MyListItem(UniqueKey() ,"6", Colors.green),
    MyListItem(UniqueKey() ,"7", Colors.blue[300]),
    MyListItem(UniqueKey() ,"8", Colors.black54),
    MyListItem(UniqueKey() ,"9", Colors.white70),
  ];

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "ReorderableListView",
      body: ReorderableListView(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("长按条目可以拖拽"),
        ),
        children: _children,
        onReorder: (oi, ni) {
          setState(() {
            if(ni > oi) ni--;
            _children.insert(ni, _children.removeAt(oi));
          });
        },
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final Key key;
  final String text;
  final Color color;

  MyListItem(this.key, this.text, this.color) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
