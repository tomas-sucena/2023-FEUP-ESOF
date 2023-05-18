import 'package:flutter/material.dart';

enum InputType { email, password, name }

class MyTextFormField extends StatefulWidget {
  final TextEditingController _controller;
  final InputType _inputType;
  final Color _color;
  final String? _labelText;

  /* CONSTRUCTOR */
  MyTextFormField(
      {required TextEditingController controller,
      required InputType inputType,
      required Color color,
      String? labelText,
      Key? key})
      : _controller = controller,
        _inputType = inputType,
        _color = color,
        _labelText = labelText,
        super(key: key);

  /* METHODS */
  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final Map<InputType, String> _labelTexts;

  /* CONSTRUCTOR */
  _MyTextFormFieldState()
      : _labelTexts = {
          InputType.email: "Email",
          InputType.password: "Password",
          InputType.name: "Name",
        };

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: (widget._inputType == InputType.password),
      decoration: InputDecoration(
        labelText: widget._labelText ?? _labelTexts[widget._inputType],
        labelStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 125)),
        floatingLabelStyle: TextStyle(color: widget._color),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget._color,
            width: 1.2,
          ),
        ),
      ),
      cursorColor: widget._color,
    );
  }
}
