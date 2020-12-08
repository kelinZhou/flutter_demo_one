import 'package:flutter/material.dart';
import 'package:flutter_demo_one/apidata/git_hub_event.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GitHubEventsPage extends StatefulWidget {
  @override
  _GitHubEventsPageState createState() => _GitHubEventsPageState();
}

class _GitHubEventsPageState extends State<GitHubEventsPage> {
  List<GitHubEvent> events = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "GitHub最新事件",
      body: FutureBuilder(
        future: get("https://api.github.com/events"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("加载失败:${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var aa = (json.decode((snapshot.data as Response).body) as List).map((e) => GitHubEvent.fromJson(e as Map<String, dynamic>)).toList();
            print(aa);
            List<GitHubEvent> data = aa;
            //以支持分隔线的方式创建ListView。
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var event = data[index];
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    //按照路径裁剪
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(2),
                      child: ClipPath(
                        //按照形状裁剪
                        clipper: ShapeBorderClipper(
                          shape: CircleBorder(), //要裁剪的形状(这里是圆形)
                        ),
                        child: Image.network(
                          event.actor.avatarUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(event.actor.name),
                    subtitle: Text(event.repo.name),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                //创建分隔线。
                return Divider(
                  height: 0,
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
