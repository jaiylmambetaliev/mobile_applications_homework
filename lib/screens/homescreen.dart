import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
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