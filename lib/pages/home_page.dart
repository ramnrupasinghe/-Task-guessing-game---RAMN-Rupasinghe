import 'dart:math';
import 'package:flutter/material.dart';
import 'right_guess_page.dart';
import 'wrong_guess_page.dart';
import 'game_over_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myNumber = 0;
  int counter = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("Guess Game"), elevation: 4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 170.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Center(
                      child: Image.asset(
                        "assets/game.png",
                        width: size.width / 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 24), // Adding more space between the two text lines
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "I have a secret number in my mind (1 - 10).You \n have 3 chances to guess it. Can you guess it?",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                  height:
                      24), // Adding more space between the text lines and the text box
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "1 of 3 chances are taken",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 60),
             ElevatedButton(
  onPressed: () {
    // Get the input from the user and convert it to int = guessNumber
    int guessNumber = int.tryParse(_controller.text) ?? 0;

    if (myNumber == guessNumber) {
      // Go to the right guess page (push)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RightGuessPage(myNumber: myNumber),
        ),
      );
    } else {
      // Increment the counter by 1
      setState(() {
        counter++;
       
      });

      if (counter > 3) {
        // Reset the counter for a new game
        counter = 0;

        // Go to the game over screen (push)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GameOverPage(myNumber: myNumber)),
        );
      } else {
        // Go to the wrong guess page (push)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WrongGuessPage()),
        );
      }
    }

    // Clear the text in the TextField after each guess
    _controller.clear();
  },
  child: const Text("Submit"),
),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    var randomNumber = Random().nextInt(10) + 1;
    myNumber = randomNumber;
    super.initState();
  }
}
