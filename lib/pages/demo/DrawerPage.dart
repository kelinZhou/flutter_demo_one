import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:flutter_demo_one/common/toast.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: 'Drawer组件演示',
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600850693734&di=7e90b016edea8ab0f5df17dd50ba9bf1&imgtype=0&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fb151f8198618367a4e83cdc321f568d1b31ce536.jpeg%3Ftoken%3D8961841436989fe3af737d06c3db0f83%26s%3DB33BE06E8464C717150E41D80300F09A'),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Hello Flutter Drawer!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('我的空间'),
              onTap: () => Toast.show(context, '我的空间'),
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
