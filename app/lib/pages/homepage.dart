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
                  Navigator.pop(context);// Navigate back to first screen when tapped.
                },
                child: const Text('Go back'),
              ),
            )
          ],
        ),
      );
  }
}
