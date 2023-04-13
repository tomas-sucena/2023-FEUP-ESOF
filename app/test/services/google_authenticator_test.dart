import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Google authentication", () {
    late MockGoogleSignIn googleAuthenticator;

    setUp(() {
      googleAuthenticator = MockGoogleSignIn();
    });

    test("should generate an idToken and accessToken when authenticating", () async {
      final GoogleSignInAccount? user = await googleAuthenticator.signIn();
      final GoogleSignInAuthentication userAuth = await user!.authentication;

      // authentication was successful
      expect(user, isNotNull);
      expect(userAuth, isNotNull);
      expect(googleAuthenticator.currentUser, isNotNull);

      // an idToken was generated
      expect(userAuth.idToken, isNotNull);

      // an accessToken was generated
      expect(userAuth.accessToken, isNotNull);
    });

    test("should not authenticate a 'null' user", () async {
      final GoogleSignInAccount? user = null;
      final GoogleSignInAuthentication? userAuth = await user?.authentication;

      // user does NOT exist
      expect(googleAuthenticator.currentUser, isNull);

      // authentication was unsuccessful
      expect(user, isNull);
      expect(userAuth, isNull);

      // no tokens were generated
      expect(userAuth?.idToken, isNull);
      expect(userAuth?.accessToken, isNull);
    });

    test("should return 'null' when the user cancels the authentication", () async {
      googleAuthenticator.setIsCancelled(true);

      final GoogleSignInAccount? user = await googleAuthenticator.signIn();
      final GoogleSignInAuthentication? userAuth = await user?.authentication;

      // user exists
      expect(googleAuthenticator.currentUser, isNotNull);

      // authentication was unsuccessful
      expect(user, isNull);
      expect(userAuth, isNull);

      // no tokens were generated
      expect(userAuth?.idToken, isNull);
      expect(userAuth?.accessToken, isNull);
    });

  });
}
