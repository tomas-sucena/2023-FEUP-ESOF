import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../services/authentication/google_authenticator.dart';
import '../utils/alignment.dart';
import '../utils/themes/theme_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(48),
          Container(
            height: 50,
            width: 360,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(233, 161, 136, 1.0),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<ThemeManager>(
                  builder: (context, themeManager, child) {
                    return IconButton(
                      icon: themeManager.getIcon(),
                      onPressed: () => themeManager.switchTheme(),
                    );
                  },
                ),

                addHorizontalSpace(250), // future search bar

                IconButton(
                  icon: SvgPicture.asset("assets/images/icons/COCO_Loupe.svg"),
                  onPressed: () => {},
                ),
              ],
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
  }
}
