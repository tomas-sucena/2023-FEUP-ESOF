import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 360,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 232, 232, 1.0),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0,2),
            blurRadius: 2,
          ),
        ]
      ),
    );
  }
}
