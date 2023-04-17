import 'package:app/services/authentication/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../services/authentication/google_authenticator.dart';
import '../utils/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.darkMode = !themeNotifier.isDark;
                  },
                  icon: Icon(
                    themeNotifier.isDark
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon_stars,
                    color: themeNotifier.isDark
                        ? Colors.white
                        : Colors.black,
                    size: 30,
                  )
              )
            ]
        ),
        body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<Authenticator>().signOut();
                      },
                      child: Text('Sign Out'),
                      ),
                  ],

                )
              ),
            ],
        ),
      );
    });
  }
}



