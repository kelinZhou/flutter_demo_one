import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<_Tag> tags = [
    _Tag('天龙八部'),
    _Tag('别拿村长不当干部'),
    _Tag('长征'),
    _Tag('白衣校花大长腿'),
    _Tag('死侍'),
    _Tag('X战警'),
    _Tag('007大破天幕杀机'),
    _Tag('信条'),
    _Tag('射雕英雄传'),
    _Tag('新白娘子传奇'),
    _Tag('三体'),
    _Tag('鹿鼎记'),
    _Tag('我和僵尸有个约会'),
    _Tag('奇异博士'),
    _Tag('蜘蛛侠'),
    _Tag('复仇者联盟-无限战争'),
    _Tag('复仇者联盟-逆转无限'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: getTagsWidget(),
      ),
    );
  }

  List<Widget> getTagsWidget() {
    return tags.map((v) {
      return InkWell(
        child: Chip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          clipBehavior: Clip.none,
          label: Text(v.str),
          padding: EdgeInsets.all(10),
          onDeleted: v.selected
              ? () {
                  _onDeleteTag(v);
                }
              : null,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/movieDetail', arguments: {
            'index': tags.indexOf(v),
            'movies': tags.map((e) => e.str).toList()
          });
        },
        onLongPress: () {
          setState(() {
            var isSelected = !v.selected;
            tags.forEach((t) {
              t.selected = false;
            });
            if (isSelected) {
              v.selected = true;
            }
          });
        },
        borderRadius: BorderRadius.circular(100),
      );
    }).toList();
  }

  _onDeleteTag(_Tag tag) {
    setState(() {
      tags.remove(tag);
    });
  }
}

class _Tag {
  bool selected;
  final String str;

  _Tag(this.str, {this.selected = false});
}
