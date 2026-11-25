import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/db/database_helper.dart';
import 'package:hsk4_grammar_offline_app/models/word.dart';
import 'word_detail_screen.dart';

class WordListScreen extends StatefulWidget {
  const WordListScreen({super.key});

  @override
  State<WordListScreen> createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  List<Word> words = [];
  List<Word> filteredWords = [];
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadWords();
  }

  Future<void> loadWords() async {
    final data = await DatabaseHelper.instance.getAllWords();
    words = data.map((e) => Word.fromMap(e)).toList();
    filteredWords = words;
    setState(() {});
  }

  void filterWords(String query) {
    filteredWords = words.where((word) {
      final q = query.toLowerCase();
      return word.chinese.contains(query) ||
          word.pinyin.toLowerCase().contains(q) ||
          word.english.toLowerCase().contains(q);
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary List"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: filterWords,
              decoration: InputDecoration(
                hintText: "Search Chinese / Pinyin / English",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Word List
          Expanded(
            child: ListView.builder(
              itemCount: filteredWords.length,
              itemBuilder: (context, index) {
                final word = filteredWords[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WordDetailScreen(word: word),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        word.chinese,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${word.pinyin}\n${word.english}"),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
