import 'dart:js';

import 'package:myquiz_app/main.dart';
import 'questions.dart';
class QuestionsBrain{
  int _currentQuestionIndex = 0;
  List<Question> _questionsList = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in feet.', true),
    Question('A slug\'blood is green.', true),
    Question('There are 4 lungs in the human body.', false),
    Question("The speed of the average human sneeze can be measured up to 100 miles an hour.", true),
    Question('The number of bones in an infant is more than that of an average human. ', true),
    Question('Humans lose an an average of 75 strands of hair per week.', false),
    Question('The human brain contains the maximum amount of muscle density', false),
    Question('The human skin regenerates once in two weeks', false),
    Question('The liver is the largest internal organ in the human body.', true),
    Question('The tongue is the only part of the human body with taste buds.', false),
    Question('The human eyes can observe 10 million different colors.', true),
    Question('The average human body consists of 60% water.', true),
  ];
  void nextQuestion(){
    if(_currentQuestionIndex<_questionsList.length-1){
      _currentQuestionIndex++;
    }
    print(_currentQuestionIndex);
    print(_questionsList.length);
  }
  bool isFinished(){
  if(_currentQuestionIndex>=_questionsList.length-1){
    return true;
  }
  else{
    return false;
  }
  }
  void resetScreen(){
    _currentQuestionIndex = 0;
  }
  String getQuestionText(){
    return _questionsList[_currentQuestionIndex].question;
  }
  bool getAnswer(){
    return _questionsList[_currentQuestionIndex].answer;
  }

}