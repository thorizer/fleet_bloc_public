import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 85, 141, 180);
const kDisabledColor = Color.fromARGB(255, 170, 170, 170);
const kBackgroundColor = Color(0XFFE5E5E5);

Color getColor(String status) {
  if (status == 'drive') {
    return Colors.green;
  } else if (status == 'stop') {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
}

const Map<String, Color> assetColor = {
  'drive': Colors.green,
  'idle': Colors.yellow,
  'stop': Colors.red,
  'disabled': Colors.grey,
};
