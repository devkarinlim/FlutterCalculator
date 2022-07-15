import 'package:flutter/material.dart';
import 'package:calculator_flutter/Helper/string_utils.dart';
import 'package:intl/intl.dart';

class ResultProvider extends ChangeNotifier {
  String _resultValue = "123.456.789";
  double firstInput = 0;
  double secondInput = 0;
  int resetCount = 0;
  int equalTapCount = 0;

  String get resultValue => _resultValue;

  void setResultValue(String value) {
    _resultValue = value;
    notifyListeners(); //trigger to rebuild widget who call builder method
  }

  void inputNumber(String title) {
    setResultValue(title);
  }

  void resetValue() {
    setResultValue("0");
  }

  void negationToggle() {
    String newValue = resultValue;
    if (resultValue.contains("-")) {
      newValue = newValue.replaceFirst("-", "");
    } else {
      newValue = "-$newValue";
    }
    setResultValue(newValue);
  }

  void percentOperation() {
    double result = resultValue.formatToNumber();
    result /= 100;
    setResultValue(_formatDecimalToString(result));
  }

  void divisionOperation() {
    setResultValue("/");
  }

  void multipleOperation() {
    setResultValue("x");
  }

  void minusOperation() {
    setResultValue("-");
  }

  void plusOperation() {
    setResultValue("+");
  }

  void equalOperation() {
    setResultValue(resultValue.removeGroupSeparator());
  }

  String _formatDecimalToString(double calcResult) {
    if (calcResult == 0) {
      return "0";
    }
    return calcResult.toStringAsExponential();
    // var formatter = NumberFormat("#,##0.00", "ID");
    // formatter.maximumFractionDigits = 10;
    // return formatter.format(calcResult);
  }
}
