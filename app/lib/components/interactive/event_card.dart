import 'package:app/services/data/database_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/charity_event.dart';
import '../../models/volunteer.dart';
import '../../pages/event_page.dart';
import '../../utils/alignment.dart';
import '../../utils/icons/coco_icon.dart';
import '../passive/icon_text.dart';
import '../passive/profile_picture.dart';

class EventCard extends StatelessWidget {
  final CharityEvent _event;
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const EventCard(
      {required CharityEvent event,
      required Volunteer volunteer,
      required DatabaseManager dbManager,
      Key? key})
      : _event = event,
        _volunteer = volunteer,
        _dbManager = dbManager,
        super(key: key);

  /* METHOD */
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(
              event: _event,
              volunteer: _volunteer,
              dbManager: _dbManager,
            ),
          ),
        )
      },
      child: Container(
        height: 99,
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
                addVerticalSpace(4),
                AutoSizeText(
                  _event.name,
                  maxFontSize: 32,
                  minFontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                IconText(
                  icon: COCOIcon(
                    iconName: "Profile",
                    height: 20,
                    themeDependent: false,
                  ),
                  text: Text(
                    _event.organizerName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                IconText(
                  icon: COCOIcon(
                    iconName: "Calendar",
                    height: 20,
                    themeDependent: false,
                  ),
                  text: Text(
                    "${_event.date.day}/${_event.date.month}/${_event.date.year}",
                    style: Theme.of(context).textTheme.bodySmall,
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
