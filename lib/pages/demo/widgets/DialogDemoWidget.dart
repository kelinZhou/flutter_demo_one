import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/dialog/CommonConfirmDialog.dart';
import 'package:flutter_demo_one/common/toast.dart';

class DialogDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogDemoWidgetState();
  }
}

class _DialogDemoWidgetState extends State<DialogDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RaisedButton(
            child: Text('AlertDialog'),
            onPressed: _showAlertDialog,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: RaisedButton(
            child: Text('SimpleDialog'),
            onPressed: _showSimpleDialog,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: RaisedButton(
            child: Text('ActionSheet'),
            onPressed: _showBottomSheet,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: RaisedButton(
            child: Text('自定义Dialog'),
            onPressed: _showCustomDialog,
          ),
        )
      ],
    );
  }

  _showAlertDialog() async {
    //1.加上async关键字
    var result = await showDialog(
        //2.加上await关键字并用变量接收
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('您觉的这个Demo对您的帮助大吗？'),
            actions: [
              FlatButton(
                child: Text('是的'),
                onPressed: () {
                  Navigator.pop(context, '您点击了按钮：是的'); //3.退出弹出时传入要返回的值。
                  Toast.show(context, '谢谢您的认可~');
                },
              ),
              FlatButton(
                child: Text('非常大'),
                onPressed: () {
                  Navigator.pop(context, '您点击了按钮：非常大'); //3.退出弹出时传入要返回的值。
                  Toast.show(context, '您真是一个好人呐~');
                },
              )
            ],
          );
        });
    print(result); //4.拿到showDialog方法的返回结果做相应处理。
  }

  _showSimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Center(
              child: Text('请您选择'),
            ),
            children: [
              SimpleDialogOption(
                child: Text('第一个选项'),
                onPressed: () {
                  Navigator.pop(context, '您点击了: 第一个选项');
                },
              ),
              Divider(height: 0),
              SimpleDialogOption(
                child: Text('第二个选项'),
                onPressed: () {
                  Navigator.pop(context, '您点击了: 第二个选项');
                },
              ),
              Divider(height: 0),
              SimpleDialogOption(
                child: Text('第三个选项'),
                onPressed: () {
                  Navigator.pop(context, '您点击了: 第三个选项');
                },
              )
            ],
          );
        });
    Toast.show(context, result ?? '您取消了选择');
  }

  _showBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: 290,
            child: Column(
              children: [
                ListTile(
                  title: Text('第一个条目'),
                  onTap: () => Navigator.pop(context, '第一个条目'),
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('第二个条目'),
                  onTap: () => Navigator.pop(context, '第二个条目'),
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('第三个条目'),
                  onTap: () => Navigator.pop(context, '第三个条目'),
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('第四个条目'),
                  onTap: () => Navigator.pop(context, '第四个条目'),
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('第五个条目'),
                  onTap: () => Navigator.pop(context, '第五个条目'),
                ),
              ],
            ),
          );
        });
    Toast.show(context, '您点击了：$result');
  }

  _showCustomDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CommonConfirmDialog(
            context: context,
            title: '提醒',
            message: '这是一个自定义的Dialog弹窗。',
            cancel: '取消',
            sure: '确定',
            onOperation: (sure) {
              Navigator.pop(context);
              Toast.show(context, sure?'你点击了确定':'你点击了取消');
            },
            // autoDismiss: true,  //自动消失
          );
        });
  }
}


