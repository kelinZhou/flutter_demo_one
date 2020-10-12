import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/toast.dart';

class ButtonsDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('普通按钮'),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              RaisedButton(
                child: Text('有颜色的按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('有阴影的按钮'),
                elevation: 20,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(width: 20),
              RaisedButton.icon(
                icon: Icon(Icons.person),
                label: Text('有图标的按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  child: Text('自适应宽度的按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text('指定宽高的按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
                child: Text('自定义形状的按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              Container(
                width: 70,
                height: 70,
                child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
                    child: Text('圆形按钮'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: CircleBorder(side: BorderSide(color: Colors.green)),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text('扁平按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){},
              ),
              SizedBox(width: 10),
              OutlineButton(
                child: Text('带边框的按钮'),
                textColor: Colors.blue,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 42,
                onPressed: () => Toast.show(context, '图标按钮'),
              )
            ],
          )
        ],
      ),
    );
  }
}
