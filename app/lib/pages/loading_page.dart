import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final Color? _color;

  /* CONSTRUCTOR */
  const LoadingPage({Color? color, Key? key})
      : _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: _color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
