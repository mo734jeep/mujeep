import 'package:flutter/material.dart';
import 'pages/add_account_page.dart';
import 'package:myproject/pages/splash_screen.dart';
import 'pages/account_datails_page.dart';

void main() {
  runApp(const PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  const PasswordManagerApp({super.key});

  @override
  Widget build(BuildContext context) {

    final Color seed = const Color(0xFF00E676);
    final Color bg = const Color(0xFF06121A);
    final Color card = const Color(0xFF071826);
    final Color accent = const Color(0xFF00F39A);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager Lite',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        scaffoldBackgroundColor: bg,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'Monospace',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white70),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accent,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: accent,
          textColor: Colors.white70,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),