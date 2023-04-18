import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth_page.dart';
import 'utils/theme_provider.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer(builder: (context, ThemeProvider themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CharityNet',
          theme: themeNotifier.isDark
              ? themeNotifier.darkTheme
              : themeNotifier.lightTheme,
          home: const AuthPage(),
        );
      }),
    );
  }
}
