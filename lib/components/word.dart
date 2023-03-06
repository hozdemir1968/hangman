import 'package:flutter/material.dart';

Widget word(String character, bool hidden) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: 45,
      width: 40,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.blue,
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
    ),
  );
}
