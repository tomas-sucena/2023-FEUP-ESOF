import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/alignment.dart';
import '../services/authentication/google_authenticator.dart';
import '../utils/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeNotifier, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          IconButton(
              onPressed: () {
                themeNotifier.darkMode = !themeNotifier.isDark;
              },
              icon: Icon(
                themeNotifier.isDark
                    ? CupertinoIcons.sun_max
                    : CupertinoIcons.moon_stars,
                color: themeNotifier.isDark ? Colors.white : Colors.black,
                size: 30,
              ))
        ]),
        body: Column(
          children: [
            addVerticalSpace(50),
            Center(
              child: const Text(
                'Home',
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 40,
                  color: Color.fromRGBO(233, 161, 136, 1),
                ),
              ),
            ),
            Image.asset('assets/images/maintenance.png', height: 500),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  GoogleAuthenticator()
                      .signOut(); // Navigate back to first screen when tapped.
                },
                child: const Text('Sign out'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
