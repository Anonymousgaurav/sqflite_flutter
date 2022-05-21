import 'package:flutter/material.dart';

class WidgetFactory {
  static Widget buildEmptyVerticalSeparator({double? height}) {
    return SizedBox(height: height);
  }

  static Widget buildEmptyHorizontalSeparator({double? width}) {
    return SizedBox(
      width: width,
    );
  }

  static Widget buildLoading() => Center(child: CircularProgressIndicator());
}
