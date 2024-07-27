import 'package:adv_basics/question_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(
                  questionIndex: data['question_index'] as int,
                  isCorrectAnswer:
                      data['user_answer'] == data['correct_answer'],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        data['question_text'] as String,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 25, 132, 75)),
                      ),
                      Text(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 213, 84, 19)),
                          data['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
