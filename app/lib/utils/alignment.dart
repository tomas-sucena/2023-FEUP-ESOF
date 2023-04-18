import 'package:flutter/material.dart';

SizedBox addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

SizedBox addSpace({required double height, required double width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
