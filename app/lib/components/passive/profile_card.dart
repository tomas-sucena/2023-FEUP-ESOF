import 'package:flutter/material.dart';

import '../../models/volunteer.dart';
import '../../utils/alignment.dart';

class ProfileCard extends StatefulWidget {
  late final Volunteer _volunteer;

  /* CONSTRUCTOR */
  ProfileCard(Volunteer volunteer) : _volunteer = volunteer;

  /* METHODS */
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
                  widget._volunteer.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._volunteer.eventsAttended.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    addHorizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(12),
                        Text(
                          'Charity Events\nAttended',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            CircleAvatar(
              radius: 52.5,
              backgroundImage: widget._volunteer.profilePicture.image,
            ),
          ],
        ),
        addVerticalSpace(10),
        Center(
          child: Text(
            'Recent Events',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
