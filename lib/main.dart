import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main(){
//runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Underscore means that the class is private.
class _MyAppState extends State<MyApp> {
  final _questions = const [
    //Map this {} or Map
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 1},
        {'text': 'white'},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 4},
        {'text': 'snake', 'score': 10},
        {'text': 'elephant', 'score': 8},
        {'text': 'cat', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite teacher?',
      'answers': [
        {'text': 'kouki', 'score': 3},
        {'text': 'faki', 'score': 10},
        {'text': 'issou', 'score': 0},
        {'text': 'ishou', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore=0;

  get questionIndex => _questionIndex;

  set questionIndex(questionIndex) {
    _questionIndex = questionIndex;
  }
  void _resetQuiz(){
    setState((){
      _questionIndex=0;
    _totalScore=0;
    });
  }
  void _answerQuestion(int score) {
    _totalScore+=score;
    setState(() {
        _questionIndex += 1;
      });
    if (questionIndex < _questions.length) {
      
      print(_questionIndex);
    } else
      print('No more Q!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //Body only take one widget
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
