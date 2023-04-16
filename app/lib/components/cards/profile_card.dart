import 'package:flutter/material.dart';

import '../alignment.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            addVerticalSpace(5),

            Text(
              'Josefina Gabriela',
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 28,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),

            Row(
              children: [
                Text(
                  'Josefina Gabriela',
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 28,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ],
            )
          ],
        ),

        Image.asset('assets/images/maintenance.png', height: 105),
      ],
    );
  }
}
