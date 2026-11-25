import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/models/grammar_point.dart';

class FillInBlankScreen extends StatefulWidget {
  final GrammarPoint gp;

  const FillInBlankScreen({super.key, required this.gp});

  @override
  State<FillInBlankScreen> createState() => _FillInBlankScreenState();
}

class _FillInBlankScreenState extends State<FillInBlankScreen> {
  final answerController = TextEditingController();
  String resultMessage = "";

  void checkAnswer() {
    if (answerController.text.trim() == widget.gp.fillAnswer.trim()) {
      setState(() => resultMessage = "Correct! ✔️");
    } else {
      setState(() => resultMessage =
          "Incorrect ❌\nCorrect answer: ${widget.gp.fillAnswer}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fill In The Blank"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.gp.fillQuestion,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(
                labelText: "Your answer:",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text("Check"),
            ),
            const SizedBox(height: 20),
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
