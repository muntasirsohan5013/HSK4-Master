import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:hsk4_grammar_offline_app/db/database_helper.dart';
import 'package:hsk4_grammar_offline_app/models/word.dart';

class ScratchSentenceScreen extends StatefulWidget {
  const ScratchSentenceScreen({super.key});

  @override
  State<ScratchSentenceScreen> createState() => _ScratchSentenceScreenState();
}

class _ScratchSentenceScreenState extends State<ScratchSentenceScreen> {
  List<Word> sentences = [];
  Word? selectedSentence;
  bool revealed = false;

  @override
  void initState() {
    super.initState();
    loadSentences();
  }

  Future<void> loadSentences() async {
    final data = await DatabaseHelper.instance.getAllWords();
    sentences = data.map((e) => Word.fromMap(e)).toList();

    if (sentences.isNotEmpty) {
      selectedSentence = sentences.first;
    }
    setState(() {});
  }

  void loadRandomSentence() {
    sentences.shuffle();
    selectedSentence = sentences.first;
    revealed = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (selectedSentence == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Scratch Sentence"),
          backgroundColor: Colors.blue.shade700,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scratch Sentence"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "Scratch to reveal the sentence:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // SCRATCH CARD
            Expanded(
              child: Center(
                child: Scratcher(
                  brushSize: 50,
                  threshold: 40,
                  color: Colors.grey.shade400,
                  onThreshold: () {
                    setState(() => revealed = true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedSentence!.exampleChinese,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          selectedSentence!.examplePinyin,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          selectedSentence!.exampleEnglish,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // SHOW BUTTON ONLY IF REVEALED
            if (revealed)
              ElevatedButton(
                onPressed: loadRandomSentence,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue.shade700,
                ),
                child: const Text(
                  "Next Sentence",
                  style: TextStyle(fontSize: 18),
                ),
              ),

            if (!revealed)
              const Text(
                "Scratch the grey area!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}


