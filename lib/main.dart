import 'package:flutter/material.dart';
import 'package:mobile_applications_homework/screens/homescreen.dart';
import 'package:mobile_applications_homework/screens/converter_screen.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Tool App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1E33),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainTabScreen(),
    );
  }
}

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Utility Tools'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Calculator'),
              Tab(text: 'Converter'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ConverterScreen(),
          ],
        ),
      ),
    );
  }
}