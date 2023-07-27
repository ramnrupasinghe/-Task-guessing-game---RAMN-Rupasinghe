import 'package:flutter/material.dart';


class WrongGuessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guess Game"), elevation: 4),
      body: Container(
        color:  const Color(0xFFffcdd2), // #c8e6c9 color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sorry! Wrong Guess. Please try again... "),
              
              const SizedBox(height: 40),
             ElevatedButton(
            onPressed: () {
            
              Navigator.pop(context); 
   
               },
               child: const Text("Guess Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
