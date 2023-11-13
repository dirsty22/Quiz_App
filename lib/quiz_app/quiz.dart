import 'package:flutter/material.dart';

import 'package:quize_app/quiz_app/question.dart';

import 'package:quize_app/quiz_app/quiz.dart';

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _QuizeAppState();
}

class _QuizeAppState extends State<QuizApp> {

  int currentQuestionIndex= 0;

  List questionBank = [
    Question.name("the Bangladesh is indendence is 1971", true),
    Question.name("Worker day is not may day", false),
    Question.name("Bangladesh's population was around 166 million people. ", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context) =>  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 150,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 16.9,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                    ElevatedButton(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => preQuestion(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green, // Change this color to the desired color
                      ),
                    ),
                  ),

                  ElevatedButton(
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => checkAnswer(true,context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green, // Change this color to the desired color
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => checkAnswer(false,context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green, // Change this color to the desired color
                      ),
                    ),
                  ),

                  

                  ElevatedButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () => nestQuestion(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green, // Change this color to the desired color
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[currentQuestionIndex].isCorrect){

      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            currentQuestionIndex++;
          });
    }else{
      debugPrint("InCorrect");
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: const Color.fromARGB(255, 228, 108, 108),
        content: Text("InCorrect!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);  
      updateQuestion();
    }
  }

updateQuestion(){
    setState(() {
     currentQuestionIndex=(currentQuestionIndex+1)%questionBank.length;
   }); 
}

  nestQuestion() {
  
    updateQuestion();
  }
  
  preQuestion() {

     setState(() {
     currentQuestionIndex=(currentQuestionIndex-1)%questionBank.length;
   }); 

  }
}
