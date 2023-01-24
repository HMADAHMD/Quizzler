import 'package:flutter/material.dart';
//import 'question.dart';

void main() {
  runApp(MyApp());
}

// stateful widget to make changes visible on screen.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Icon> scores = [];
  List<Question> questionbank = [
    Question(
        q: "Pakistan’s Khewra Salt Mine is one of the oldest in the world.",
        a: true),
    Question(q: "Pakistan’s national fruit is the watermelon", a: false),
    Question(
        q: "Pakistan has one of the largest irrigation systems in the world.",
        a: true),
    Question(
        q: "Pakistan was the first Islamic country to become a nuclear power.",
        a: true),
  ];

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 25, 25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              questionbank[count].questionText,
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                bool correctanswer = questionbank[count].answerText;
                setState(() {
                  if (correctanswer == true) {
                    scores.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scores.add(Icon(Icons.close, color: Colors.red));
                  }
                });
                count++;
                print("True Pressed");
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "True",
                  style: TextStyle(fontSize: 25),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              onPressed: () {
                bool correctanser = questionbank[count].answerText;
                setState(() {
                  if (correctanser == false) {
                    scores.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scores.add(Icon(Icons.close, color: Colors.red));
                  }
                });
                print("False Pressed");
                count++;
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "False",
                  style: TextStyle(fontSize: 25),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              children: scores,
            ),
          )
        ],
      ),
    ));
  }
}

// questionsClass
class Question {
  String questionText = '';
  bool answerText = true;

  Question({required String q, required bool a}) {
    questionText = q;
    answerText = a;
  }
}
