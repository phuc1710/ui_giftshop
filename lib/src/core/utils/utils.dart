import 'package:flutter/material.dart';

class Utils {
  static List<BoxShadow> buildBoxShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ];
  }
}
