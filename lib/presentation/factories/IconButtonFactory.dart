import 'package:flutter/material.dart';
import 'package:ilaz/resources/ColorsRes.dart';

class IconButtonFactory {
  static Icon buildIcon(bool active, double scaleFactor, IconData icon) {
    if (active) {
      return Icon(
        icon,
        size: 32.0 * scaleFactor,
        color: ColorsRes.primaryColor,
      );
    }
    return Icon(
      icon,
      size: 30.0 * scaleFactor,
      color: ColorsRes.iconDisabledColor,
    );
  }
}
