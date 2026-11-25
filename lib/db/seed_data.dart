import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import '../services/json_loader.dart';

class SeedData {
  static Future<void> insertInitialData({bool force = false}) async {
    final db = await DatabaseHelper.instance.database;

    if (!force) {
      final wordCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM words'));
      if (wordCount != 0) return;
    } else {
      // Clear previous data
      await db.delete('words');
      await db.delete('grammar');
    }

    // Load JSON data
    final words = await JsonLoader.loadList('assets/data/hsk_words.json');
    final grammar = await JsonLoader.loadList('assets/data/hsk_grammar.json');

    for (final word in words) {
      await db.insert('words', word);
    }

    for (final rule in grammar) {
      await db.insert('grammar', rule);
    }
  }
}
