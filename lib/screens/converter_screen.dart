import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isKmToMiles = true;
  String _result = '';

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) {
      setState(() => _result = 'Invalid input');
      return;
    }

    double converted;
    if (_isKmToMiles) {
      converted = input * 0.621371;
      _result = '$input km = ${converted.toStringAsFixed(2)} miles';
    } else {
      converted = input / 0.621371;
      _result = '$input miles = ${converted.toStringAsFixed(2)} km';
    }

    setState(() {});
  }

  Widget buildOutlinedTextButton(String label, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.black,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildOutlinedTextButton(
            _isKmToMiles ? 'Switch to Miles → KM' : 'Switch to KM → Miles',
                () {
              setState(() {
                _isKmToMiles = !_isKmToMiles;
                _result = '';
                _controller.clear();
              });
            },
            Colors.orange,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              labelText: _isKmToMiles ? 'Enter distance in kilometers' : 'Enter distance in miles',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          buildOutlinedTextButton('Convert', _convert, Colors.green),
          const SizedBox(height: 24),
          Text(
            _result,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}