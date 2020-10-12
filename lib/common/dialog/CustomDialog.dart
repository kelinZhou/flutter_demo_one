import 'package:flutter/material.dart';

//自定义Dialog必须继承自Dialog
class CustomDialog extends Dialog {
  final Widget child;

  CustomDialog({this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: child,
    );
  }
}