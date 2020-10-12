import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo_one/Navigation.dart';
import 'package:flutter_demo_one/common/mutableState.dart';
import 'package:flutter_demo_one/model/hospital.dart';
import 'package:flutter_demo_one/styles.dart';

import '../../common/commonListState.dart';

Dio dio = Dio(BaseOptions(baseUrl: 'http://staging.kangyu.co'));

class HospitalList extends StatefulWidget {
  @override
  MutableState<StatefulWidget> createState() {
    return _HospitalListState();
  }
}

class _HospitalListState extends CommonListState<HospitalList, Hospital> {
  String keyWords = "";
  int _page = 1;

  @override
  void initState() {
    super.initState();
    getHospitalList(_page);
  }

  @override
  onLoadMore() {
    getHospitalList(++_page);
  }

  void getHospitalList(int page) async {
    var resp = await dio.post('/v3/hospitals/search', data: {"page": page});
    currentState = PageState.data;
    addItem((resp.data['hospitals'] as List).map((v) => Hospital(v)).toList());
  }

  @override
  Widget onCreateItemCell(BuildContext context, Hospital item, int position) {
    return Card(
      margin: Styles.margin.listCardItem,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: InkWell(
        child: HospitalCell(item),
        borderRadius: BorderRadius.circular(10),
        onTap: (){
          Navigation.jumpToHospitalDetail(context, item);
        },
      ),
    );
  }
}

class HospitalCell extends Container {
  HospitalCell(Hospital item)
      : super(
            padding: Styles.padding.common,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(item.imageUrl, width: 70, height: 70)),
                Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsetsDirectional.only(start: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                              margin: EdgeInsetsDirectional.only(top: 12),
                              child: Text(
                                item.address,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Color(4289374890)),
                              ))
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(item.reputation,
                          style: TextStyle(
                              color: Color(4283076834),
                              fontWeight: FontWeight.bold)),
                      Text(item.reviewsCount,
                          style: TextStyle(color: Color(4289374890))),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              decoration:
                                  BoxDecoration(color: Color(4283076834)),
                              padding: EdgeInsets.only(
                                  left: 6, top: 3, right: 6, bottom: 3),
                              child: Text(item.appointmentCovered.toString(),
                                  style: TextStyle(color: Color(4294967295)))))
                    ],
                  ),
                )
              ],
            ));
}
