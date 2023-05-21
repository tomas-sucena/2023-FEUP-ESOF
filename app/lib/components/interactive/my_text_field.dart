import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MyInputType { name, email, password, phoneNumber }

class MyTextField extends StatefulWidget {
  final TextEditingController _controller;
  final MyInputType _inputType;
  final Key? _key;
  final Color _color;
  final Color _focusedColor;
  final String? _label;
  final String? _hint;
  final double _padding;

  /* CONSTRUCTOR */
  MyTextField(
      {required TextEditingController controller,
      required MyInputType inputType,
      required Key key,
      required Color color,
      Color? focusedColor,
      String? label,
      String? hint,
      double? padding})
      : _controller = controller,
        _inputType = inputType,
        _key = key,
        _color = color,
        _focusedColor = focusedColor ?? color,
        _label = label,
        _hint = hint,
        _padding = 30;

  /* METHODS */
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode;
  late Color _currColor;
  final Map<MyInputType, String> _labels;
  final Map<MyInputType, TextInputType> _keyboardTypes;
  final Map<MyInputType, String? Function(String?)?> _validators;

  /* CONSTRUCTOR */
  _MyTextFieldState()
      : _focusNode = FocusNode(),
        _labels = {
          MyInputType.name: "Name",
          MyInputType.email: "Email",
          MyInputType.password: "Password",
          MyInputType.phoneNumber: "Phone Number",
        },
        _keyboardTypes = {
          MyInputType.name: TextInputType.name,
          MyInputType.email: TextInputType.emailAddress,
          MyInputType.password: TextInputType.visiblePassword,
          MyInputType.phoneNumber: TextInputType.phone,
        },
        _validators = {
          MyInputType.name: (name) {
            if (name == null || name.isEmpty) return "Name cannot be empty!";

            for (int i in name.codeUnits) {
              if (i >= '0'.codeUnitAt(0) && i <= '9'.codeUnitAt(0))
                return "Name cannot contain numbers!";
            }

            return null;
          },
          MyInputType.email: (email) {
            if (email == null || email.isEmpty) return "Email cannot be empty!";

            RegExp regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

            return regex.hasMatch(email) ? null : "Invalid email address!";
          },
          MyInputType.password: (password) {
            if (password == null || password.isEmpty)
              return "Password cannot be empty!";

            if (password.length < 8)
              return "Password must have at least 8 characters!";

            RegExp regex = RegExp(
                r"^(?=.*[A-Z])(?=.*[\W])(?=.*[0-9])(?=.*[a-z]).{8,128}$");
            return regex.hasMatch(password) ? null : "Password is too weak!";
          },
          MyInputType.phoneNumber: (phoneNumber) {
            if (phoneNumber == null || phoneNumber.isEmpty)
              return "Phone number cannot be empty!";

            RegExp regex = RegExp(r"(9[1236]\d) ?(\d{3}) ?(\d{3})");

            return regex.hasMatch(phoneNumber)
                ? null
                : "Phone number is badly formatted!";
          },
        };

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
    return Form(
      key: widget._key,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget._padding),
        child: TextFormField(
          controller: widget._controller,
          focusNode: _focusNode,
          validator: _validators[widget._inputType],
          onTap: _switchColor,
          obscureText: widget._inputType == MyInputType.password,
          keyboardType: _keyboardTypes[widget._inputType],
          decoration: InputDecoration(
            labelText: widget._label ?? _labels[widget._inputType],
            labelStyle: TextStyle(color: _currColor),
            hintText: widget._hint,
            hintStyle: TextStyle(color: _currColor.withOpacity(0.5)),
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
          ),
          cursorColor: widget._focusedColor,
          cursorWidth: 1.0,
          style: TextStyle(color: _currColor),
        ),
      ),
    );
  }
}
