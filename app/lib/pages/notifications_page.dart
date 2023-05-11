import 'package:flutter/material.dart';

import '../utils/alignment.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with AutomaticKeepAliveClientMixin<NotificationsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(40),
          Center(
            child: const Text(
              'Notifications',
              style: const TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
          Image.asset('assets/images/maintenance.png', height: 500),
        ],
      ),
    );
  }
}
