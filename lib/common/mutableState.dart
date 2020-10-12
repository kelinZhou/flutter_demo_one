import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MutableState<T extends StatefulWidget> extends State<T> {
  PageState _currentState = PageState.loading;

  set currentState(PageState state) {
    setState(() {
      this._currentState = state;
    });
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    switch (this._currentState) {
      case PageState.data:
        return buildDataPage(context);
      case PageState.loading:
        return buildLoadingPage(context);
      default:
        return buildErrorPage(context);
    }
  }

  @protected
  Widget buildDataPage(BuildContext context);

  @protected
  Widget buildLoadingPage(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text('正在加载，请稍后...')
        ],
      ),
    );
  }

  @protected
  Widget buildErrorPage(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text('页面出错'),
    );
  }
}

enum PageState { loading, error, data }
