class CalculatorViewModel {
  double? _firstNumber;
  double? _secondNumber;
  String? _operation;

  String? get operation => _operation;
  double? get firstNumber => _firstNumber;
  double? get secondNumber => _secondNumber;

  void setOperation(String operation) {
    _operation = operation;
  }

  String onClickOperators(String operation, String number) {
    if (double.tryParse(number) != null) {
      if (_operation == "AC") {
        _clearNumbers();
      }
      if (operation == "÷" ||
          operation == "x" ||
          operation == "+" ||
          operation == "-") {
        setOperation(operation);
        if (firstNumber != null) {
          _secondNumber = double.parse(number);
        } else {
          _firstNumber = double.parse(number);
        }
      }

      if (operation == "=") {
        String? result;
        _secondNumber ??= double.parse(number);
        if (_operation == "÷") result = _division();
        if (_operation == "x") result = _multiplication();
        if (_operation == "+") result = _addition();
        if (_operation == "-") result = _subtraction();
        _clearNumbers();
        return result!;
      }
    }
    return '';
  }

  String _division() {
    return (firstNumber! / secondNumber!).toString();
  }

  String _addition() {
    return (firstNumber! + secondNumber!).toString();
  }

  String _multiplication() {
    return (firstNumber! * secondNumber!).toString();
  }

  String _subtraction() {
    return (firstNumber! - secondNumber!).toString();
  }

  void _clearNumbers() {
    _firstNumber = null;
    _secondNumber = null;
  }
}
