import 'package:flutter/material.dart';

extension SizeSensitiveTextStyle on TextStyle {
  TextStyle resize(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    if (deviceWidth < 270) return copyWith(fontSize: fontSize! * 0.3);
    if (deviceWidth < 300) return copyWith(fontSize: fontSize! * 0.4);
    if (deviceWidth < 360) return copyWith(fontSize: fontSize! * 0.5);
    if (deviceWidth < 440) return copyWith(fontSize: fontSize! * 0.63);
    if (deviceWidth < 510) return copyWith(fontSize: fontSize! * 0.75);
    return this;
  }
}
