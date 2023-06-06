import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

class QuestionView extends StatefulWidget {
  final Map<String, dynamic> map;
  final int index;
  const QuestionView({super.key, required this.map, required this.index});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  String answerGroupValue = '';
  @override
  void initState() {
    answerGroupValue = quizList[widget.index][givenAnswer];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.index + 1}. ',
                style: const TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Text(
                  widget.map[question],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Column(
          children: (widget.map[answers] as List)
              .map((answer) => Row(
                    children: [
                      Radio<String>(
                        value: answer,
                        groupValue: answerGroupValue,
                        onChanged: (value) {
                          setState(() {
                            answerGroupValue = value!;
                          });
                          quizList[widget.index][givenAnswer] = answer;
                        },
                      ),
                      Text(
                        answer,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
