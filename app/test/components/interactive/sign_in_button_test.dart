import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../lib/components/interactive/sign_in_button.dart';
import '../../../lib/services/authentication/authenticator.dart';

// Mock class
class MockAuthenticator extends Mock implements Authenticator {}

void main() {
  group("Google sign-in button", () {
    late MockAuthenticator authenticator;

    setUp(() {
      authenticator = MockAuthenticator();
      when(authenticator.signIn()).thenReturn("Signing in with Google");
    });

    testWidgets('should display the Google logo and some text', (tester) async {
      await tester.pumpWidget(
        SignInButton(
          authenticator: authenticator,
          logoFilename: "google_logo.png",
          name: "Google",
        ),
      );

      // the button contains the Google logo
      expect(find.image(const AssetImage("assets/images/google_logo.png")),
          findsOneWidget);

      // the button contains some text
      expect(find.text('Sign in with Google'), findsOneWidget);
    });

    testWidgets('should trigger the authenticator when tapped', (tester) async {
      await tester.pumpWidget(
        SignInButton(
          authenticator: authenticator,
          logoFilename: "google_logo.png",
          name: "Google",
        ),
      );

      await tester.tap(find.text('Sign in with Google'));

      // the authenticator attempts to sign the user in
      verify(authenticator.signIn()).called(1);
    });
  });
}
