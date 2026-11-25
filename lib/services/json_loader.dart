import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<List<Map<String, dynamic>>> loadList(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((item) => Map<String, dynamic>.from(item)).toList();
  }
}
