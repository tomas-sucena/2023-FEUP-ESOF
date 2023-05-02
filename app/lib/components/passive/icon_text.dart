import 'package:app/utils/alignment.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Widget _icon;
  final Text _text;
  final double _distance;

  // constructor
  IconText({required Widget icon, required Text text, double? distance})
      : _icon = icon,
        _text = text,
        _distance = distance ?? 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        addHorizontalSpace(_distance),
        _text,
      ],
    );
  }
}
