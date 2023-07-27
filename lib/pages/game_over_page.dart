import 'package:flutter/material.dart';
import 'package:guessgame/pages/home_page.dart';

class GameOverPage extends StatelessWidget {
  
  const GameOverPage({Key? key, required this.myNumber});

  final int myNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guess Game"), elevation: 4),
      backgroundColor: const Color(0xFFbbdefb), // Adding the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sorry Game Over. My secret number is"),
            const SizedBox(height: 40),
            Text(
              myNumber.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Go to home page (push replacement)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Start the Game Again"),
            ),
          ],
        ),
      ),
    );
  }
}
