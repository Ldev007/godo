import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get h => mq.size.height;
  double get w => mq.size.width;
  double get bottomInset => mq.viewInsets.bottom;
  double get bottomPadding => mq.viewPadding.bottom;
  double get topInset => mq.viewInsets.top;
  double get topPadding => mq.viewPadding.top;
}
