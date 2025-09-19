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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("توليد كلمة مرور"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // طول كلمة المرور
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("الطول:"),
                Slider(
                  value: passwordLength.toDouble(),
                  min: 6,
                  max: 32,
                  divisions: 26,
                  label: "$passwordLength",
                  onChanged: (value) {
                    setState(() {
                      passwordLength = value.toInt();
                    });
                  },
                ),
                Text("$passwordLength"),
              ],
            ),
            // خيارات