import 'package:flutter/material.dart';

enum InputType { text, password, description }

class MyTextFormField extends StatefulWidget {
  final TextEditingController _controller;
  final InputType _inputType;
  final Color _color;
  final Color _focusedColor;
  final String? _labelText;
  final double _padding;
  final OutlineInputBorder? _border;

  /* CONSTRUCTOR */
  MyTextFormField(
      {required TextEditingController controller,
      required Color color,
      Color? focusedColor,
      InputType? inputType,
      String? labelText,
      double? padding,
      OutlineInputBorder? border,
      Key? key})
      : _controller = controller,
        _color = color,
        _focusedColor = focusedColor ?? color,
        _inputType = inputType ?? InputType.text,
        _labelText = labelText ?? '',
        _padding = 30,
        _border = border,
        super(key: key);

  /* METHODS */
  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  /* METHOD */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget._padding),
      child: TextFormField(
        controller: widget._controller,
        obscureText: (widget._inputType == InputType.password),
        decoration: InputDecoration(
          labelText: widget._labelText,
          labelStyle: TextStyle(color: widget._color),
          floatingLabelStyle: TextStyle(color: widget._focusedColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget._color,
              width: 1.2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget._focusedColor,
              width: 1.2,
            ),
          ),
          border: widget._border,
        ),
        cursorColor: widget._focusedColor,
        cursorWidth: 1.0,
        style: TextStyle(color: widget._focusedColor),
      ),
    );
  }
}
