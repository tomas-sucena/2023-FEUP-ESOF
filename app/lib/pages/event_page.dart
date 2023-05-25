import 'package:flutter/material.dart';

import '../components/passive/icon_text.dart';
import '../components/passive/profile_picture.dart';
import '../models/charity_event.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';
import 'loading_page.dart';
import 'profile_page.dart';

class EventPage extends StatefulWidget {
  final CharityEvent _event;
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const EventPage(
      {required CharityEvent event,
      required Volunteer volunteer,
      required DatabaseManager dbManager,
      Key? key})
      : _event = event,
        _volunteer = volunteer,
        _dbManager = dbManager,
        super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late bool _isFavorite;

  /* METHODS */
  Future<void> _showOrganizer() async {
    // show a loading screen
    showDialog(
      context: context,
      builder: (context) => const LoadingPage(),
    );

    final Volunteer organizer =
        await widget._dbManager.getVolunteer(widget._event.organizerID);

    // discard the loading screen
    Navigator.of(
      context,
      rootNavigator: true,
    ).pop();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          volunteer: organizer,
          dbManager: widget._dbManager,
        ),
      ),
    );
  }

  Future<void> _favoriteEvent() async {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    _isFavorite
        ? widget._volunteer.favoriteEvents.add(widget._event)
        : widget._volunteer.favoriteEvents.remove(widget._event);

    // show a loading screen
    showDialog(
      context: context,
      builder: (context) => const LoadingPage(),
    );

    // update the database
    await widget._dbManager.addVolunteer(widget._volunteer);

    Navigator.of(
      context,
      rootNavigator: true,
    ).pop(); // discard the loading screen
  }

  @override
  void initState() {
    super.initState();
    _isFavorite = widget._volunteer.favoriteEvents.contains(widget._event);
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _favoriteEvent,
        child: COCOIcon(
          iconName: _isFavorite ? "Star_active" : "Star",
          height: _isFavorite ? 41 : 38,
          themeDependent: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      widget._event.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    InkWell(
                      onTap: _showOrganizer,
                      child: IconText(
                        icon: COCOIcon(
                          iconName: "Profile",
                          height: 24,
                        ),
                        text: Text(
                          widget._event.organizerName,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                    addVerticalSpace(30),
                    IconText(
                      icon: COCOIcon(
                        iconName: "Location",
                        height: 24,
                      ),
                      text: Text(
                        widget._event.location,
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
                        widget._event.email,
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
                        widget._event.phoneNumber,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: _showOrganizer,
                    child: ProfilePicture(
                      image: widget._event.profilePicture,
                      size: 105,
                    ),
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
                widget._event.description,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
