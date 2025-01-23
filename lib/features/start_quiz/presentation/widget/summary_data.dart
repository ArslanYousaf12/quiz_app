import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summary.map((data) {
        return Row(
          children: [
            Text(((data['question_index'] as int) + 1).toString()),
            Column(
              children: [
                Text(data['questions'].toString()),
                const SizedBox(
                  height: 5,
                ),
                Text(data['correct_answer'].toString()),
                Text(data['choosan_answer'].toString()),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
