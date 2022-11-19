import 'package:flutter/material.dart';
import 'colors.dart';

Widget word(String character, bool hidden) {
  return Container(
    height: 45,
    width: 35,
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    ),
  );
}
