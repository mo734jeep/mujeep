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

