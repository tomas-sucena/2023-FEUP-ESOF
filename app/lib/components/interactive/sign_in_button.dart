import 'package:flutter/material.dart';

import '../../services/authentication/authenticator.dart';
import '../../utils/alignment.dart';

class SignInButton extends StatelessWidget {
  late final Authenticator _auth;
  late final Image _logo;
  late final String _text;
  late final Color _backgroundColor;
  late final Color _textColor;
  late final TextDirection _textDirection;

  /* CONSTRUCTOR */
  SignInButton(
      {required Authenticator authenticator,
      required String logoFilename,
      String? name,
      Color? backgroundColor,
      Color? textColor,
      TextDirection? textDirection}) {
    _auth = authenticator;

    _logo = Image.asset(
      "assets/images/$logoFilename",
      height: 30,
      width: 30,
    );

    _text = "Sign in" + ((name == null) ? "" : " with $name");
    _backgroundColor = backgroundColor ?? Colors.white;
    _textColor = textColor ?? const Color.fromRGBO(108, 108, 108, 20);
    _textDirection = textDirection ?? TextDirection.ltr;
  }

  /* METHOD */
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _auth.signIn();
      },
      child: Container(
        height: 45,
        width: 250,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          textDirection: _textDirection,
          children: [
            addHorizontalSpace(10),
            _logo,
            addHorizontalSpace(15),
            Center(
              child: Text(
                _text,
                textDirection: _textDirection,
                style: TextStyle(
                  color: _textColor,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
