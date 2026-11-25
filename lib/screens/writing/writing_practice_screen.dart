import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/db/database_helper.dart';
import 'writing_history_screen.dart';

class WritingPracticeScreen extends StatefulWidget {
  const WritingPracticeScreen({super.key});

  @override
  State<WritingPracticeScreen> createState() => _WritingPracticeScreenState();
}

class _WritingPracticeScreenState extends State<WritingPracticeScreen> {
  final TextEditingController writingController = TextEditingController();
  String message = "";

  Future<void> saveWriting() async {
    String text = writingController.text.trim();

    if (text.isEmpty) {
      setState(() {
        message = "Please write something.";
      });
      return;
    }

    await DatabaseHelper.instance.insertWriting(text);

    setState(() {
      message = "Saved successfully!";
      writingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text("Writing Practice"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WritingHistoryScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "Write a sentence or paragraph:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: TextField(
                controller: writingController,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Type here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveWriting,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue.shade700,
              ),
              child: const Text(
                "Save Writing",
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
