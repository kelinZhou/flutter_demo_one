import 'package:flutter/material.dart';

class Styles {
  static Margins get margin {
    return Margins();
  }
  
  static Padding get padding {
    return Padding();
  }
}

class Margins {
  EdgeInsetsGeometry get listItem {
    return EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0, bottom: 4.0);
  }
  EdgeInsetsGeometry get listCardItem {
    return EdgeInsets.only(left: 12.0, right: 12.0, top: 6.0, bottom: 6.0);
  }
}

class Padding {
  EdgeInsetsGeometry get common {
    return EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12);
  }
}
