import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/interactive/event_card_viewer.dart';
import '../components/interactive/my_button.dart';
import '../components/interactive/profile_info.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';

class ProfilePage extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;
  final bool _canEdit;

  /* CONSTRUCTOR */
  ProfilePage(
      {required Volunteer volunteer,
      required DatabaseManager dbManager,
      bool? canEdit,
      Key? key})
      : _volunteer = volunteer,
        _dbManager = dbManager,
        _canEdit = canEdit ?? false,
        super(key: key);

  /* METHOD */
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /* METHODS */
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: (widget._canEdit)
          ? null
          : AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(40),
            Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            addVerticalSpace(10),
            ProfileInfo(
              volunteer: widget._volunteer,
              dbManager: widget._dbManager,
              canEdit: widget._canEdit,
            ),
            addVerticalSpace(24),
            Center(
              child: Text(
                'Recent Events',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            addVerticalSpace(16),
            SizedBox(
              height: 330,
              width: 360,
              child: EventCardViewer(
                events: widget._volunteer.organizedEvents,
                volunteer: widget._volunteer,
                dbManager: widget._dbManager,
                onRefresh: _refresh,
              ),
            ),
            (widget._canEdit)
                ? MyButton(
                    onTap: _signOut,
                    text: const Text("Sign out"),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
