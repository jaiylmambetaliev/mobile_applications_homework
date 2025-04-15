import 'package:flutter/material.dart';
import 'package:mobile_applications_homework/services/calculator_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CalculatorLogic calculator = CalculatorLogic();

  void _onPressed(String value) {
    setState(() {
      calculator.input(value);
    });
  }

  Widget buildButton(String text, {Color color = Colors.grey}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _onPressed(text),
          child: Stack(
            children: [
              // Black outline
              Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black,
                ),
              ),
              // Foreground text
              Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                calculator.display,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('0'),
                    buildButton('.'),
                    buildButton('C', color: Colors.red),
                    buildButton('+', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('=', color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}