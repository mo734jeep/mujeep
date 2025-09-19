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

