import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MutableState<T extends StatefulWidget> extends State<T> {
  PageState _currentState = PageState.loading;
  String _errorMessage = "系统错误";

  void showDataView() {
    setState(() {
      _currentState = PageState.data;
    });
  }

  void showLoadingView() {
    setState(() {
      _currentState = PageState.loading;
    });
  }

  void showRetryView(String message) {
    setState(() {
      _errorMessage = message;
      _currentState = PageState.error;
    });
  }

  @protected
  void onGetInitData() {}

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
    return InkWell(
      child: Align(
        alignment: Alignment.center,
        child: Text("$_errorMessage,点击重试"),
      ),
      onTap: () {
        showLoadingView();
        onGetInitData();
      },
    );
  }
}

enum PageState { loading, error, data }
