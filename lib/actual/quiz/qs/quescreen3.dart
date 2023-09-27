import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wealthwise/actual/quiz/qs/result.dart';
import 'package:wealthwise/actual/quiz/qs/result1.dart';
import 'package:wealthwise/actual/quiz/qs/result2.dart';
import 'package:wealthwise/actual/quiz/qs/result3.dart';
import 'package:wealthwise/designed_boxes/neubox4.dart';
import 'package:wealthwise/designed_boxes/neubox5.dart';
import 'analysis.dart';
import 'answerbutton.dart';
import 'questions.dart';

TextStyle _getTextStyle() {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
  );
}

class QuestionsScreen3 extends StatefulWidget {
  const QuestionsScreen3({super.key});

  @override
  State<QuestionsScreen3> createState() => _QuestionsScreen3State();
}

class _QuestionsScreen3State extends State<QuestionsScreen3> {
  var current_question_index = 0;

  void nextquestion() {
    setState(() {
      current_question_index++;
    });
  }

  TextStyle _getTextStyle2() {
    return GoogleFonts.katibeh(
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current_question = questions3[current_question_index];
    var correct_answered = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${current_question_index + 1}',
                style: _getTextStyle(),
              ),
              SizedBox(
                height: 40,
              ),
              Neubox5(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      current_question.text,
                      style: _getTextStyle2(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ...current_question.getshuffledanswers().map((answer) {
                      return AnswerButton(
                          answertext: answer,
                          ontap: () {
                            answered_ques3.add(answer);
                            if (correct_answers3.contains(answer)) {
                              correctly_answered3.add(answer);
                            }
                            if (current_question_index == 4) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Result3(
                                  chosen_answers: correct_answered,
                                );
                              }));
                            } else {
                              nextquestion();
                            }
                          });
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
