import 'package:app/components/alignment.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Widget _icon;
  final String _text;
  late final double _distance;

  // constructor
  IconText({required Widget icon, required String text, double? distance})
      : _icon = icon,
        _text = text {
    _distance = (distance == null) ? 5 : distance;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        addHorizontalSpace(_distance),
        Text(
          _text,
          style: const TextStyle(
            fontFamily: 'Jost',
            fontSize: 16,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
      ],
    );
  }
}
