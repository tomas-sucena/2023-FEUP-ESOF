import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final TextEditingController _controller;
  final Color _color;
  final Color _focusedColor;
  final bool _hideText;
  final String? _labelText;
  final double _padding;
  final OutlineInputBorder? _border;

  /* CONSTRUCTOR */
  MyTextFormField(
      {required TextEditingController controller,
      required Color color,
      Color? focusedColor,
      String? labelText,
      bool? hideText,
      double? padding,
      OutlineInputBorder? border,
      Key? key})
      : _controller = controller,
        _color = color,
        _focusedColor = focusedColor ?? color,
        _hideText = hideText ?? false,
        _labelText = labelText ?? '',
        _padding = 30,
        _border = border,
        super(key: key);

  /* METHODS */
  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final FocusNode _focusNode;
  late Color _currColor;

  /* CONSTRUCTOR */
  _MyTextFormFieldState() : _focusNode = FocusNode();

  /* METHODS */
  @override
  void initState() {
    super.initState();
    _currColor = widget._color;
    _focusNode.addListener(_switchColor);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _switchColor() {
    setState(() {
      _currColor = _focusNode.hasFocus ? widget._focusedColor : widget._color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget._padding),
      child: TextFormField(
        controller: widget._controller,
        focusNode: _focusNode,
        onTap: _switchColor,
        obscureText: widget._hideText,
        decoration: InputDecoration(
          labelText: widget._labelText,
          labelStyle: TextStyle(color: _currColor),
          floatingLabelStyle: TextStyle(color: _currColor),
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
        style: TextStyle(color: _currColor),
      ),
    );
  }
}
