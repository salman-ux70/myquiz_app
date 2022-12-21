import 'package:flutter/material.dart';
import 'questions_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionsBrain questionsBrain = QuestionsBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), child: Quizler()),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}

class Quizler extends StatefulWidget {
  const Quizler({Key? key}) : super(key: key);
  @override
  State<Quizler> createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  List<Icon> iconsList = [];
  void checkAnswer(bool userChoice) {
    setState(() {
      if(questionsBrain.isFinished()==true){
        Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
        questionsBrain.resetScreen();
        iconsList = [];
      }
      else if (userChoice == questionsBrain.getAnswer()) {
        iconsList.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        iconsList.add(const Icon(Icons.close, color: Colors.red));
      }
      questionsBrain.nextQuestion();
    });
  }

  void chechNext() {
    if (questionsBrain.isFinished()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionsBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: iconsList,
        ),
      ],
    );
  }
}
