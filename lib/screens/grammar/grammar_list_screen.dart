import 'package:flutter/material.dart';
import 'package:hsk4_grammar_offline_app/db/database_helper.dart';
import 'package:hsk4_grammar_offline_app/models/grammar_point.dart';
import 'grammar_detail_screen.dart';

class GrammarListScreen extends StatefulWidget {
  const GrammarListScreen({super.key});

  @override
  State<GrammarListScreen> createState() => _GrammarListScreenState();
}

class _GrammarListScreenState extends State<GrammarListScreen> {
  List<GrammarPoint> grammarPoints = [];

  @override
  void initState() {
    super.initState();
    loadGrammar();
  }

  Future<void> loadGrammar() async {
    final data = await DatabaseHelper.instance.getAllGrammar();
    grammarPoints = data.map((e) => GrammarPoint.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Grammar Lessons"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: grammarPoints.length,
        itemBuilder: (context, index) {
          final gp = grammarPoints[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                gp.title,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                gp.explanationEnglish,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GrammarDetailScreen(gp: gp),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
