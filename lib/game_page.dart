import 'package:code_guess/game.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final controller = TextEditingController();
  final game = Game();
  var feedbackText = '';
  var showTestButton = false;

  void handleClickGuess(){
    setState(() {
      showTestButton = !showTestButton;
    });
    print('Button Click');
    print(controller.text);
    var guess = int.tryParse(controller.text);
    if(guess == null){
      print('Input error');
      setState(() {
        feedbackText = 'Input error, please try again';
      });
    }else{
     var result = game.doGuess(guess);
     if(result == Result.tooHigh){
       print('Too High');
       setState(() {
         feedbackText = 'Too High, please try again';
       });
     }else if(result == Result.tooLow){
       print('Too Low');
       setState(() {
         feedbackText = 'Too Low, please try again';
       });
     }else{
       print('Correct');
       setState(() {
         feedbackText = 'Correct, Good job!';
       });
     }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worameth'),
      ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text('Pease enter number between 1 and 100'),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter',
                ),
              ),
              ElevatedButton(
                  onPressed: handleClickGuess,
                  child: Text('Guess')
              ),
              Text(feedbackText),
              Icon(showTestButton ? Icons.print : Icons.access_alarm),
            ]
        ),
    );
  }
}
