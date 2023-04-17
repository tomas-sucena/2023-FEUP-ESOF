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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '64',
                      style: const TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 50,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                    addHorizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(12),
                        Text(
                          'Charity Events\nAttended',
                          style: const TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            height: 1.2,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/images/pedroanime.png'),
            ),
          ],
        ),
        addVerticalSpace(10),
        Center(
          child: Text(
            'Recent Events',
            style: const TextStyle(
              fontFamily: 'Jost',
              fontSize: 28,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
