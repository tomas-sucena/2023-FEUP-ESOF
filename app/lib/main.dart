import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth_page.dart';
import 'services/firebase_options.dart';
import 'utils/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            home: AuthPage(),
            theme: themeManager.getTheme(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
