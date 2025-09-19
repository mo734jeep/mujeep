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
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> accounts = [];

  @override
  Widget build(BuildContext context) {
    // Colors consistent with theme
    final Color neon = const Color(0xFF00F39A);
    final Color panel = const Color(0xFF071826);
    final Color glow = const Color(0xFF07212A);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, size: 20, color: Colors.white70),
            const SizedBox(width: 8),
            const Text("Password Manager Lite"),
            const SizedBox(width: 8),
          ],
        ),
      ),
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
        child: accounts.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.05)],
                  ),
                  border: Border.all(color: neon.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.06),
                      blurRadius: 24,
                      spreadRadius: 2,
                    ),
                  ],
                ),