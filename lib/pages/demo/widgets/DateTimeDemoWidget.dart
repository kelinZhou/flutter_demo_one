import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/DateFormat.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';


class DateTimeDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DateTimeDemoWidgetState();
  }
}

class _DateTimeDemoWidgetState extends State<DateTimeDemoWidget> {

  var date = DateTime.now();
  var time = formatDate(DateTime.now(), DateType.HH_mm);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('当的时间戳为：${DateTime
                  .now()
                  .millisecondsSinceEpoch}')
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('当的时间为：${DateTime.fromMillisecondsSinceEpoch(DateTime
                  .now()
                  .millisecondsSinceEpoch)}')
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('格式化后的时间为：${formatDate(
                  DateTime.now(), DateType.yyyy_MM_dd_HH_mm_ss)}')
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('系统日期时间组件：'),
              InkWell(
                  child: Row(
                    children: [
                      Text(formatDate(date, DateType.yyyy_MM_dd)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2050)).then((value) {
                      if (value != null) {
                        setState(() => date = value);
                      }
                    });
                  }
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(time),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) =>
                      setState(() => time = value.format(context)));
                },
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('三方日期时间组件：'),
              InkWell(
                  child: Row(
                    children: [
                      Text(formatDate(date, DateType.yyyy_MM_dd)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        initialDateTime: this.date,
                        dateFormat: 'yyyy年|MM月|dd日',
                        pickerTheme: DateTimePickerTheme(
                          cancel: Text('取消'),
                          confirm: Text('确定'),
                        ),
                      onConfirm: (d, s) => setState(() => this.date = d)
                    );
                  }
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(time),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      initialDateTime: this.date,
                      dateFormat: 'HH时:mm分',
                      pickerTheme: DateTimePickerTheme(
                        cancel: Text('取消'),
                        confirm: Text('确定'),
                      ),
                      onConfirm: (d, s) => setState(() => this.time = formatDate(d, DateType.HH_mm))
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}