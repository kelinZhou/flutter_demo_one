import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:flutter_demo_one/common/toast.dart';

class UserAccountsDrawerHeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: 'Drawer组件演示',
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Kelin'),
              accountEmail: Text('kelin410@163.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602514093108&di=36968dde524557ed98c99af329d5ddc4&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170929%2Fe28345e8e98b4d7e80cea28586415e47.jpeg'),
              ),
              onDetailsPressed: () => Toast.show(context, '查看用户信息'),
              arrowColor: Colors.blue,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('我的空间'),
              onTap: () {
                Navigator.pop(context);
                Toast.show(context, '我的空间');
              },
            ),
            Divider(height: 0),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('我的收藏'),
              onTap: () => Toast.show(context, '我的收藏'),
            ),
            Divider(height: 0),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('新增用户'),
              onTap: () => Toast.show(context, '新增用户'),
            ),
            Divider(height: 0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置中心'),
              onTap: () => Toast.show(context, '设置中心'),
            ),
            Divider(height: 0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('版本信息：   v1.2.0'),
              ),
            ),
            SizedBox(height: 12)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text('当前页面为Drawer组件的演示页面，用于演示类似Android中的抽屉布局。',
              strutStyle: StrutStyle(
                  forceStrutHeight: true,
                  height: 1.3 //通过strutStyle属性中的height设置行间距。
                  )),
        ),
      ),
    );
  }
}
