import 'package:app/components/alignment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../components/passive/profile_card.dart';
import '../utils/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //User _user;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeNotifier, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
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
        body: Column(
          children: [
            addVerticalSpace(50),
            Center(
              child: const Text(
                'Profile',
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 40,
                  color: Color.fromRGBO(233, 161, 136, 1),
                ),
              ),
            ),
            addVerticalSpace(15),
            ProfileCard(),
          ],
        ),
      );
    });
  }
}
