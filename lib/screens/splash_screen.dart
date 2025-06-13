import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();

    // Tambahan: Navigasi otomatis setelah 3 detik ke HomeScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 100, height: 100),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Kodein ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Note',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF5B13)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}