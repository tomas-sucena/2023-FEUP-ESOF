import 'package:app/services/authentication/googleAuth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
           children: [
             const SizedBox(height: 50),

             Image.asset('assets/images/maintenance.png',
                  height: 500),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  GoogleAuth().signOut();// Navigate back to first screen when tapped.
                },
                child: const Text('Sign out'),
              ),
            ),

             const SizedBox(height: 10),

             const Text("Artur Oliveira"),
             const Text("Duarte Gonçalves"),
             const Text("Gonçalo Pinho"),
             const Text("João Afonso Viveiros"),
             const Text("Tomás Sucena Lopes"),
          ],
        ),
      );
  }
}
