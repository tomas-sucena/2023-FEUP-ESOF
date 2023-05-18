import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/interactive/sign_in_button.dart';
import '../services/authentication/email_authenticator.dart';
import '../services/authentication/google_authenticator.dart';
import '../utils/alignment.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _nameController;
  late bool _showRegister;

  /* CONSTRUCTOR */
  _LoginPageState()
      : _emailController = TextEditingController(),
        _passwordController = TextEditingController(),
        _nameController = TextEditingController();

  /* METHODS */
  @override
  void initState() {
    super.initState();
    _showRegister = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        addVerticalSpace(20),
        ElevatedButton(
          onPressed: () {
            EmailAuthenticator(
              email: _emailController.text,
              password: _passwordController.text,
            ).signIn();
          },
          child: Text("Sign in"),
        ),
        addVerticalSpace(10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 125),
                ),
              ),
              TextSpan(
                text: "Register here",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _switchBottom(),
              ),
            ],
          ),
        ),
        addVerticalSpace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const Expanded(
                child: const Divider(
                  thickness: 0.3,
                  color: const Color.fromRGBO(0, 0, 0, 125),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text("OR"),
              ),
              const Expanded(
                child: const Divider(
                  thickness: 0.3,
                  color: const Color.fromRGBO(0, 0, 0, 125),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(15),
        SignInButton(
          authenticator: GoogleAuthenticator(),
          logoFilename: "google_logo.png",
          name: "Google",
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        addVerticalSpace(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
        ),
        addVerticalSpace(20),
        ElevatedButton(
          onPressed: () {
            EmailAuthenticator(
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
            ).register();
          },
          child: Text("Register"),
        ),
      ],
    );
  }

  void _switchBottom() {
    setState(() {
      _showRegister = !_showRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_showRegister) {
          _switchBottom();
          return false;
        }

        return true;
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(232, 159, 135, 1),
              const Color.fromRGBO(248, 240, 167, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(80),
                Center(
                  child: Image.asset(
                    "assets/images/Logo.png",
                    height: 170,
                    color: const Color.fromRGBO(0, 0, 0, 125),
                  ),
                ),
                const Text(
                  'CHARITY.NET',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 125),
                    fontFamily: 'Dokdo',
                    fontSize: 60,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                (_showRegister) ? _buildRegisterForm() : _buildLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
