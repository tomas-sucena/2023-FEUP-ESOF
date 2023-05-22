import 'package:flutter/material.dart';

class MyTextBox extends StatefulWidget {
  final TextEditingController _controller;
  final Key _key;
  final Color _color;
  final Color _focusedColor;
  final String? _label;
  final String? _hint;
  final double _padding;

  /* CONSTRUCTOR */
  MyTextBox(
      {required TextEditingController controller,
      required Key key,
      required Color color,
      Color? focusedColor,
      String? label,
      String? hint,
      double? padding})
      : _controller = controller,
        _key = key,
        _color = color,
        _focusedColor = focusedColor ?? color,
        _label = label,
        _hint = hint,
        _padding = 30;

  /* METHODS */
  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  final FocusNode _focusNode;
  late Color _currColor;

  /* CONSTRUCTOR */
  _MyTextBoxState() : _focusNode = FocusNode();

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

  String? _validateText(String? text) {
    if (text == null || text.isEmpty)
      return "${widget._label ?? "Text"} cannot be empty!";

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._key,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget._padding),
        child: TextFormField(
          controller: widget._controller,
          focusNode: _focusNode,
          validator: _validateText,
          onTap: _switchColor,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: widget._label,
            labelStyle: TextStyle(color: _currColor),
            hintText: widget._hint,
            hintStyle: TextStyle(color: _currColor.withOpacity(0.5)),
            alignLabelWithHint: true,
            floatingLabelStyle: TextStyle(color: _currColor),
            errorStyle: TextStyle(fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget._color,
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget._focusedColor,
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
            ),
          ),
          cursorColor: widget._focusedColor,
          cursorWidth: 1.0,
          style: TextStyle(color: _currColor),
          maxLines: 8,
        ),
      ),
    );
  }
}
