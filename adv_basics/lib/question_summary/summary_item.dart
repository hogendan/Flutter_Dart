import 'package:adv_basics/question_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.summaryData});

  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: summaryData['question_index'] as int,
            isCorrectAnswer:
                summaryData['user_answer'] == summaryData['correct_answer'],
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
                  summaryData['question_text'] as String,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  summaryData['user_answer'] as String,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 25, 132, 75)),
                ),
                Text(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 213, 84, 19)),
                    summaryData['correct_answer'] as String),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
