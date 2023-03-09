import 'package:flutter/material.dart';

void main(){
  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Hello World!"),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'abc',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),

      ),
    );
  }
}
