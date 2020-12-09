import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/mutableState.dart';

abstract class CommonListState<W extends StatefulWidget, T>
    extends MutableState<W> {
  List<T> _dataList = List();

  @protected
  void setItem(List<T> list) {
    setState(() {
      this._dataList = list;
    });
  }

  @protected
  void addItem(List<T> list) {
    setState(() {
      this._dataList.addAll(list);
    });
  }

  List<T> get dataList{
    return this._dataList;
  }

  @protected
  onRefresh() {}

  @protected
  onLoadMore(bool retry) {}

  @override
  Widget buildDataPage(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: createItemCell),
      onRefresh: () => Future(() => onRefresh()),
    );
  }

  Widget createItemCell(BuildContext context, int position) {
    return onCreateItemCell(context, _dataList.elementAt(position), position);
  }

  @protected
  Widget onCreateItemCell(BuildContext context, T item, int position);
}
