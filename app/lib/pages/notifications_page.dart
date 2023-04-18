import 'package:flutter/material.dart';

import '../components/alignment.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          Center(
            child: const Text(
              'Notifications',
              style: const TextStyle(
                fontFamily: 'Jost',
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
