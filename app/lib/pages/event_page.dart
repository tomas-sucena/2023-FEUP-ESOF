import 'package:flutter/material.dart';

import '../components/passive/icon_text.dart';
import '../components/passive/profile_picture.dart';
import '../models/event.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';

class EventPage extends StatelessWidget {
  final MyEvent _event;

  /* CONSTRUCTOR */
  const EventPage({required MyEvent event, Key? key})
      : _event = event,
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: COCOIcon(
            iconName: "Left_arrow",
            height: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          addVerticalSpace(40),
          Center(
            child: const Text(
              'Event',
              style: const TextStyle(
                fontSize: 40,
                color: const Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
          addVerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(5),
                  Text(
                    _event.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  IconText(
                    icon: COCOIcon(
                      iconName: "Profile",
                      height: 24,
                    ),
                    text: Text(
                      _event.organizer.name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  addVerticalSpace(30),
                  IconText(
                    icon: COCOIcon(
                      iconName: "Location",
                      height: 24,
                    ),
                    text: Text(
                      _event.location,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  addVerticalSpace(4),
                  IconText(
                    icon: COCOIcon(
                      iconName: "Email",
                      height: 24,
                    ),
                    text: Text(
                      _event.email,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  addVerticalSpace(4),
                  IconText(
                    icon: COCOIcon(
                      iconName: "Phone",
                      height: 24,
                    ),
                    text: Text(
                      _event.phoneNumber,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ProfilePicture(
                  image: _event.organizer.profilePicture,
                  size: 105,
                ),
              ),
            ],
          ),
          addVerticalSpace(54),
          Center(
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          addVerticalSpace(24),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: Text(
              _event.description,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
