import 'package:flutter/material.dart';

import '../components/passive/icon_text.dart';
import '../components/passive/profile_picture.dart';
import '../models/charity_event.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';

class EventPage extends StatefulWidget {
  final CharityEvent _event;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const EventPage(
      {required CharityEvent event,
      required DatabaseManager dbManager,
      Key? key})
      : _event = event,
        _dbManager = dbManager,
        super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late final Future<Volunteer> _organizer;

  /* METHODS */
  Future<Volunteer> _fetchOrganizerData() async {
    return widget._dbManager.getVolunteer(widget._event.organizerID);
  }

  @override
  void initState() {
    super.initState();
    _organizer = _fetchOrganizerData();
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: const CircularProgressIndicator(
        color: const Color.fromRGBO(233, 161, 136, 1),
      ),
    );
  }

  Widget _buildPage() {
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
                    widget._event.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  IconText(
                    icon: COCOIcon(
                      iconName: "Profile",
                      height: 24,
                    ),
                    text: Text(
                      widget._event.organizerName,
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
                child: ProfilePicture(
                  image: widget._event.profilePicture,
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
              widget._event.description,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Volunteer>(
      future: _organizer,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return _buildLoadingScreen();

        return _buildPage();
      },
    );
  }
}
