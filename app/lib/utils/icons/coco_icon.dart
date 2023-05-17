import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class COCOIcon extends StatelessWidget {
  final String _iconName;
  final double _height;
  final double _width;
  final bool _themeDependent;

  /* CONSTRUCTOR */
  const COCOIcon(
      {required String iconName,
      required double height,
      double? width,
      bool? themeDependent,
      Key? key})
      : _iconName = iconName,
        _height = height,
        _width = width ?? height,
        _themeDependent = themeDependent ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _theme = (Theme.of(context).scaffoldBackgroundColor ==
            Color.fromRGBO(26, 27, 46, 1.0))
        ? "dark_mode"
        : "light_mode";
    final String _dir = (_themeDependent) ? _theme : "others";

    return SvgPicture.asset(
      "assets/images/icons/$_dir/COCO_$_iconName.svg",
      width: _width,
      height: _height,
    );
  }
}
