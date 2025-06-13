import 'package:flutter/material.dart';
import 'package:notes_app/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodein Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        fontFamily: 'Nunito',
      ),
      home: const SplashScreen(), // <-- Ganti ini menjadi DetailScreen
    );
  }
}
