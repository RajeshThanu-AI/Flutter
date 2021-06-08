import 'package:flutter/material.dart';
import './quizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(
      Quizzler(),
    );

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  int trueValue = 0;
  int falseValue = 0;
  List<Icon> scoreKeeper = [];

  void ansCheck(bool ansValue) {
    setState(
      () {
        if (quizBrain.getCorrectAns() == ansValue) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          trueValue++;
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          falseValue++;
        }
        quizBrain.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext conatext) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'oh god Krishna',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
          flex: 7,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                quizBrain.getQuestion().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () => {
                ansCheck(true),
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () => {
                ansCheck(false),
              },
              child: Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.teal,
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('The Result'),
              Row(
                children: scoreKeeper,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'True:$trueValue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'False:$falseValue',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
