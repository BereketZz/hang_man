import 'package:flutter/material.dart';
import 'package:hang_man/Colors/colors.dart';

Widget letters(String chracter, bool hidden) {
  return Container(
    width: 50,
    height: 65,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        color: AppColor.primaryColorDark,
        borderRadius: BorderRadius.circular(4.0)),
    child: Visibility(
        visible: hidden,
        child: Text(
          chracter,
          style: TextStyle(
              color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
        )),
  );
}
