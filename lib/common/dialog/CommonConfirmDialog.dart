import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/dialog/CustomDialog.dart';

typedef OperationCallback = void Function(bool sure);

class CommonConfirmDialog extends CustomDialog {

  _startTimer(context, onOperation){
    Timer.periodic(Duration(seconds: 5), (timer) {
      timer.cancel();
      onOperation(true);
    });
  }

  CommonConfirmDialog({
    @required BuildContext context,
    String title,
    String message,
    String cancel,
    String sure,
    @required OperationCallback onOperation,
    bool autoDismiss = false,
  }) : super(
            child: Stack(alignment: Alignment.center, children: [
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 18),
                      Divider(height: 0),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  color: Color(0xFFF6F6F6),
                  constraints: BoxConstraints(minHeight: 100),
                  child: Center(
                    child: Text(message),
                  ),
                ),
                Divider(height: 0),
                _operationButtons(cancel, sure, onOperation)
              ],
            ),
          )
        ])){
    _startTimer(context, onOperation);
  }

  static Widget _operationButtons(
      cancel, String sure, OperationCallback onOperation) {
    if (cancel?.isNotEmpty == true) {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8))),
                child: Text(cancel),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => onOperation(false),
              ),
            ),
          ),
          VerticalDivider(width: 0.1),
          Expanded(
            child: Container(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8))),
                child: Text(sure, style: TextStyle(color: Colors.blue)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => onOperation(true),
              ),
            ),
          )
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Text(sure, style: TextStyle(color: Colors.blue)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => onOperation(true),
              ),
            ),
          )
        ],
      );
    }
  }
}
