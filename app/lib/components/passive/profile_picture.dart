import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final ImageProvider<Object> _image;
  final double _size;

  /* CONSTRUCTOR */
  const ProfilePicture(
      {required ImageProvider image, required double size, Key? key})
      : _image = image,
        _size = size,
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _image,
          fit: BoxFit.fitHeight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
