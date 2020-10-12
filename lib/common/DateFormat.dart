import 'package:date_format/date_format.dart' as df;

String formatDate(DateTime date, DateType type){
  return df.formatDate(date, _getFormat(type));
}

_getFormat(DateType type){
  switch (type) {
    case DateType.yyyy_MM_dd:
      return ['yyyy', '-', 'mm', '-', 'dd'];
    case DateType.yyyy_MM_dd_HH:
      return ['yyyy', '-', 'mm', '-', 'dd', ' ', 'HH'];
    case DateType.yyyy_MM_dd_HH_mm:
      return ['yyyy', '-', 'mm', '-', 'dd', ' ', 'HH', ':', 'nn'];
    case DateType.yyyy_MM_dd_HH_mm_ss:
      return ['yyyy', '-', 'mm', '-', 'dd', ' ', 'HH', ':', 'nn', ":", 'ss'];
    case DateType.HH_mm_ss:
      return ['HH', ':', 'nn', ":", 'ss'];
    case DateType.HH_mm:
      return ['HH', ':', 'nn'];
  }
}

enum DateType{
  yyyy_MM_dd,
  yyyy_MM_dd_HH,
  yyyy_MM_dd_HH_mm,
  yyyy_MM_dd_HH_mm_ss,
  HH_mm,
  HH_mm_ss
}