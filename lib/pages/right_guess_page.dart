import 'package:flutter/material.dart';
import 'package:guessgame/pages/home_page.dart';


class RightGuessPage extends StatelessWidget {

  const RightGuessPage({Key? key, required this.myNumber});

  final int myNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guess Game"), elevation: 4),
      body: Container(
        color: const Color(0xFFC8E6C9), // #c8e6c9 color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Yes! You guessed it right. My Secret Number is"),
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
      ),
    );
  }
}
