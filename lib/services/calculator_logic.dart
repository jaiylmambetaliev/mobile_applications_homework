class CalculatorLogic {
  String _input = '';
  String _result = '';
  String _operator = '';
  bool _hasOperator = false;

  String get display => _input.isEmpty ? '0' : _input;

  void input(String value) {
    if (value == 'C') {
      _clear();
    } else if (value == '=') {
      _calculate();
    } else if (_isOperator(value)) {
      _addOperator(value);
    } else {
      _addDigit(value);
    }
  }

  bool _isOperator(String val) => ['+', '-', '*', '/'].contains(val);

  void _addDigit(String digit) {
    if (_input.length >= 9) return;

    // If previous result exists and no operator has been input yet, start fresh
    if (_result.isNotEmpty && !_hasOperator) {
      _input = '';
      _result = '';
    }

    _input += digit;
  }

  void _addOperator(String op) {
    if (_input.isEmpty || _hasOperator) return;

    _input += op;
    _operator = op;
    _hasOperator = true;
  }

  void _calculate() {
    if (!_hasOperator) return;

    final parts = _input.split(_operator);
    if (parts.length != 2) return;

    final num1 = double.tryParse(parts[0]) ?? 0;
    final num2 = double.tryParse(parts[1]) ?? 0;
    double result = 0;

    switch (_operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          _input = 'Error';
          _resetState();
          return;
        }
        break;
    }

    _result = result.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    _input = _result;
    _resetState();
  }

  void _clear() {
    _input = '';
    _result = '';
    _operator = '';
    _hasOperator = false;
  }

  void _resetState() {
    _operator = '';
    _hasOperator = false;
  }
}