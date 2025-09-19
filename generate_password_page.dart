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
            CheckboxListTile(
              title: const Text("تضمين الأرقام"),
              value: includeNumbers,
              onChanged: (value) {
                setState(() {
                  includeNumbers = value ?? true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("تضمين الرموز"),
              value: includeSymbols,
              onChanged: (value) {
                setState(() {
                  includeSymbols = value ?? true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("أحرف كبيرة"),
              value: includeUppercase,
              onChanged: (value) {
                setState(() {
                  includeUppercase = value ?? true;
                });
              },
            ),
            const SizedBox(height: 20),

            // كلمة المرور الناتجة
            SelectableText(
              generatedPassword.isEmpty ? "—" : generatedPassword,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // زر التوليد
            ElevatedButton.icon(
              onPressed: generatePassword,
              icon: const Icon(Icons.refresh),
              label: const Text("توليد كلمة مرور"),
            ),

            const SizedBox(height: 20),

            // زر الرجوع مع الكلمة
            ElevatedButton.icon(
              onPressed: generatedPassword.isNotEmpty
                  ? () {
                Navigator.pop(context, generatedPassword);
              }
                  : null,
              icon: const Icon(Icons.check),
              label: const Text("استخدام هذه الكلمة"),
            ),
          ],
        ),
      ),
    );
  }
}