import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_one/common/mutableState.dart';

abstract class CommonListState<W extends StatefulWidget, T> extends MutableState<W> {
  List<T> _dataList = List();

  set dataList(List<T> list) {
    setState(() {
      this._dataList = list;
    });
  }

  void addItem(List<T> list) {
    setState(() {
      this._dataList.addAll(list);
    });
  }

  @protected
  onLoadMore() {}


  @override
  Widget buildDataPage(BuildContext context) {
    return ListView.builder(
        itemCount: _dataList.length, itemBuilder: _createItemCell);
  }

  Widget _createItemCell(BuildContext context, int position) {
    if (position + 3 == this._dataList.length) {
      onLoadMore();
    }
    return onCreateItemCell(context, _dataList.elementAt(position), position);
  }

  @protected
  Widget onCreateItemCell(BuildContext context, T item, int position);
}
