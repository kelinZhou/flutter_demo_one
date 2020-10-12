import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart' as ft;

class Toast{
  static show(BuildContext context, String text) {
    ft.Toast.show(text, context, gravity: ft.Toast.CENTER);
  }
}