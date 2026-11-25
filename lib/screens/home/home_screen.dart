import 'package:flutter/material.dart';
import '../words/word_list_screen.dart';
import '../grammar/grammar_list_screen.dart';
import '../writing/writing_practice_screen.dart';
import '../writing/scratch_sentence_screen.dart';
import '../progress/my_progress_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.book,
        "title": "Vocabulary",
        "screen": const WordListScreen(),
      },
      {
        "icon": Icons.school,
        "title": "Grammar",
        "screen": const GrammarListScreen(),
      },
      {
        "icon": Icons.edit,
        "title": "Writing Practice",
        "screen": const WritingPracticeScreen(),
      },
      {
        "icon": Icons.layers,
        "title": "Scratch Sentence",
        "screen": const ScratchSentenceScreen(),
      },
      {
        "icon": Icons.bar_chart,
        "title": "My Progress",
        "screen": const MyProgressScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("HSK4 Learning Center"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item["screen"]),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200,
                    blurRadius: 8,
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item["icon"], size: 50, color: Colors.blue.shade800),
                  const SizedBox(height: 8),
                  Text(
                    item["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
