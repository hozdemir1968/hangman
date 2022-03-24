import 'package:flutter/material.dart';
import 'package:hangman/tools/colors.dart';

Widget word(String character, bool hidden) {
  return Container(
    height: 45,
    width: 35,
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
    ),
  );
}
