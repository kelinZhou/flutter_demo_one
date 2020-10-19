import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/commonListState.dart';

abstract class PageableState<W extends StatefulWidget, T>
    extends CommonListState<W, T> {
  int pageSize = 10;

  LoadMoreState _currentLoadMoreState = LoadMoreState.loading;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    this._scrollController.addListener(() {
      if (_currentLoadMoreState != LoadMoreState.finished &&
          this._scrollController.position.pixels >
              this._scrollController.position.maxScrollExtent - 50) {
        onLoadMore(false);
      }
    });
  }


  void setLoadMoreError() {
    setState(() {
      _currentLoadMoreState = LoadMoreState.retry;
    });
  }

  @override
  void setItem(List<T> list) {
    super.setItem(list);
    setState(() {
      _currentLoadMoreState = list.length < pageSize
          ? LoadMoreState.finished
          : LoadMoreState.loading;
    });
  }

  @override
  void addItem(List<T> list) {
    super.addItem(list);
    setState(() {
      _currentLoadMoreState = list.length < pageSize
          ? LoadMoreState.finished
          : LoadMoreState.loading;
    });
  }

  @override
  Widget buildDataPage(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
          controller: this._scrollController,
          itemCount: dataList.length + 1,
          itemBuilder: (context, index) {
            if (index == dataList.length) {
              return LoadMoreCellWidget(
                state: _currentLoadMoreState,
                onReload: (){
                  setState(() {
                    _currentLoadMoreState = LoadMoreState.loading;
                  });
                  onLoadMore(true);
                },
              );
            } else {
              return createItemCell(context, index);
            }
          }),
      onRefresh: () => Future.delayed(Duration(), () => onRefresh()),
    );
  }
}

class LoadMoreCellWidget extends StatelessWidget {
  final LoadMoreState state;
  final ReloadCallback onReload;

  LoadMoreCellWidget({this.state, this.onReload});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoadMoreState.retry:
        return InkWell(
          child: Container(
            height: 50,
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('加载失败，点击重试')],
            ),
          ),
          onTap: onReload,
        );
      case LoadMoreState.finished:
        return Container(
          height: 50,
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('-------我也是有底线的-------')],
          ),
        );
      default:
        return Container(
          height: 50,
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2.0),
            ), SizedBox(width: 12), Text('加载中...')],
          ),
        );
    }
  }
}

typedef ReloadCallback = Function();

enum LoadMoreState { loading, retry, finished }
