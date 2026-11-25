import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/models/grammar_point.dart';
import 'fill_in_blank_screen.dart';

class GrammarDetailScreen extends StatelessWidget {
  final GrammarPoint gp;

  const GrammarDetailScreen({super.key, required this.gp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gp.title),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gp.title,
                style: const TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
              const Text("Explanation (Chinese):",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                gp.explanationChinese,
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 20),
              const Text("Explanation (English):",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                gp.explanationEnglish,
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 20),
              const Text("Example Sentence:",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                gp.example,
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
                  child: const Text(
                    "Practice Fill-in-the-Blank",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FillInBlankScreen(gp: gp),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
