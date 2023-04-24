import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/components/interactive/sign_in_button.dart';
import '../../../lib/services/authentication/google_authenticator.dart';

void main() {
  group("Google sign-in button", () {
    testWidgets('should display the Google logo and some text', (tester) async {
      await tester.pumpWidget(
        SignInButton(
          authenticator: GoogleAuthenticator(),
          logoFilename: "google_logo.png",
          name: "Google",
        ),
      );

      expect(find.image(const AssetImage("assets/images/google_logo.png")), findsOneWidget);
      expect(find.text('Sign in with Google'), findsOneWidget);
    });

    testWidgets('should trigger the authenticator when pressed', (tester) async {
      await tester.pumpWidget(
        SignInButton(
          authenticator: GoogleAuthenticator(),
          logoFilename: "google_logo.png",
          name: "Google",
        ),
      );

      // tap the button

    });
  });
}
