import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myproject/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color neon = const Color(0xFF00F39A);

    return Scaffold(
      backgroundColor: const Color(0xFF06121A),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF04121A),
              const Color(0xFF071826),
              const Color(0xFF081E2A),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [neon.withOpacity(0.2), Colors.transparent],
                    radius: 0.85,
                  ),
                ),
                child: Icon(
                  Icons.security,
                  size: 100,
                  color: neon,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Password Manager Lite",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: neon,
                  letterSpacing: 1.5,
                  fontFamily: 'Monospace',
                  shadows: [
                    Shadow(
                      blurRadius: 20,
                      color: neon.withOpacity(0.6),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}