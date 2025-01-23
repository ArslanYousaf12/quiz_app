import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //todo:add silver scrollable
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['correct_answer'] == data['choosan_answer']
                        ? Colors.green.shade500
                        : Colors.red.shade100,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                      color: data['correct_answer'] == data['choosan_answer']
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['questions'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['correct_answer'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 192, 136, 202),
                            fontSize: 15),
                      ),
                      Text(
                        data['choosan_answer'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(146, 0, 0, 0), fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
