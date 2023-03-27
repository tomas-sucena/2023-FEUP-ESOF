import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text('Notifications',
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 30,
              )),
          Image.asset('assets/images/maintenance.png', height: 500),
        ],
      ),
    );
  }
}
