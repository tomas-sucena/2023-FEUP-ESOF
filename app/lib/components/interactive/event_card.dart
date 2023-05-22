import 'package:flutter/material.dart';

import '../../models/charity_event.dart';
import '../../pages/event_page.dart';
import '../../utils/alignment.dart';
import '../../utils/icons/coco_icon.dart';
import '../passive/icon_text.dart';
import '../passive/profile_picture.dart';

class EventCard extends StatelessWidget {
  final CharityEvent _event;

  /* CONSTRUCTOR */
  const EventCard({required CharityEvent event, Key? key})
      : _event = event,
        super(key: key);

  /* METHOD */
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(event: _event),
          ),
        )
      },
      child: Container(
        height: 100,
        width: 360,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 232, 232, 1.0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHorizontalSpace(12),
            ProfilePicture(
              image: _event.profilePicture,
              size: 80,
            ),
            addHorizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(8),
                Text(
                  _event.name,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 32,
                      ),
                ),
                addVerticalSpace(5),
                IconText(
                  icon: COCOIcon(
                    iconName: "Profile",
                    height: 24,
                    themeDependent: false,
                  ),
                  text: Text(
                    _event.organizerName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
