import 'package:flutter/material.dart';

class ScreenUtil {
  final BuildContext context;

  ScreenUtil(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;
  EdgeInsets get padding => MediaQuery.of(context).padding;
  EdgeInsets get viewInsets => MediaQuery.of(context).viewInsets;
  Orientation get orientation => MediaQuery.of(context).orientation;
}
