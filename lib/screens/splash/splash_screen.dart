import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hsk4_grammar_offline_app/core/animations/animation_paths.dart';
import 'package:hsk4_grammar_offline_app/db/seed_data.dart';
import 'package:hsk4_grammar_offline_app/screens/language/language_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await SeedData.insertInitialData(force: true); // always reload JSON
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AnimationPaths.splash,
              height: 220,
              width: 220,
              repeat: true,
            ),
            const SizedBox(height: 20),
            Text(
              "HSK4 Grammar Learning",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
