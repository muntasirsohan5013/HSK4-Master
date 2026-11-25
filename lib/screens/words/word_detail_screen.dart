import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/models/word.dart';

class WordDetailScreen extends StatelessWidget {
  final Word word;

  const WordDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word.chinese),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.chinese,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              word.pinyin,
              style: const TextStyle(fontSize: 24, color: Colors.red),
            ),
            const SizedBox(height: 10),

            Text(
              "Meaning: ${word.english}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),
            const Text(
              "Example Sentence:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              word.exampleChinese,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),

            Text(
              word.examplePinyin,
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 5),

            Text(
              word.exampleEnglish,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
