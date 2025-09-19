import 'dart:math';
import 'package:flutter/material.dart';

class GeneratePasswordPage extends StatefulWidget {
  const GeneratePasswordPage({super.key});

  @override
  State<GeneratePasswordPage> createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  int passwordLength = 12;
  bool includeNumbers = true;
  bool includeSymbols = true;
  bool includeUppercase = true;

  String generatedPassword = "";

  void generatePassword() {
    const String lowercase = "abcdefghijklmnopqrstuvwxyz";
    const String uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const String numbers = "0123456789";
    const String symbols = "!@#\$%^&*()-_=+<>?";

    String chars = lowercase;
    if (includeUppercase) chars += uppercase;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;

    Random random = Random.secure();
    String password = List.generate(
      passwordLength,
          (index) => chars[random.nextInt(chars.length)],
    ).join();

    setState(() {
      generatedPassword = password;
    });
  }
