import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('hsk4_grammar_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  // GET all words
Future<List<Map<String, dynamic>>> getAllWords() async {
  final db = await instance.database;
  return await db.query('words');
}

// GET single word by ID
Future<Map<String, dynamic>?> getWordById(int id) async {
  final db = await instance.database;
  final result = await db.query('words', where: 'id = ?', whereArgs: [id]);

  if (result.isNotEmpty) return result.first;
  return null;
}


// GET all grammar points
Future<List<Map<String, dynamic>>> getAllGrammar() async {
  final db = await instance.database;
  return await db.query('grammar');
}

// GET a grammar point by ID
Future<Map<String, dynamic>?> getGrammarById(int id) async {
  final db = await instance.database;
  final result = await db.query('grammar', where: 'id = ?', whereArgs: [id]);

  if (result.isNotEmpty) return result.first;
  return null;
}

// INSERT writing entry
Future<int> insertWriting(String text) async {
  final db = await instance.database;

  return await db.insert("writing", {
    "content": text,
    "createdAt": DateTime.now().toIso8601String(),
  });
}

// GET all writing entries
Future<List<Map<String, dynamic>>> getAllWriting() async {
  final db = await instance.database;
  return await db.query("writing", orderBy: "id DESC");
}


  Future _createDB(Database db, int version) async {
    // Vocabulary table
    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        chinese TEXT,
        pinyin TEXT,
        english TEXT,
        exampleChinese TEXT,
        examplePinyin TEXT,
        exampleEnglish TEXT
      )
    ''');

    // Grammar table
    await db.execute('''
      CREATE TABLE grammar (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        explanationChinese TEXT,
        explanationEnglish TEXT,
        example TEXT,
        fillQuestion TEXT,
        fillAnswer TEXT
      )
    ''');

    // Writing table
    await db.execute('''
      CREATE TABLE writing (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        content TEXT,
        createdAt TEXT
      )
    ''');

    // Progress table
    await db.execute('''
      CREATE TABLE progress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        wordsLearned INTEGER,
        grammarCompleted INTEGER,
        writingCount INTEGER,
        lastActive TEXT
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
