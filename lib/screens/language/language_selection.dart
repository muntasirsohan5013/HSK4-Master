import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = "en";

  Future<void> saveAndContinue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("appLanguage", selectedLanguage);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Choose Language / 选择语言",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),

              // English Option
              RadioListTile(
                title: const Text("🇬🇧 English"),
                value: "en",
                groupValue: selectedLanguage,
                onChanged: (val) {
                  setState(() => selectedLanguage = val.toString());
                },
              ),

              // Chinese Option
              RadioListTile(
                title: const Text("🇨🇳 中文"),
                value: "zh",
                groupValue: selectedLanguage,
                onChanged: (val) {
                  setState(() => selectedLanguage = val.toString());
                },
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: saveAndContinue,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  selectedLanguage == "en" ? "Continue" : "继续",
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
