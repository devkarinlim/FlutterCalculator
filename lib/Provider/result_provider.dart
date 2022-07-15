import 'package:flutter/material.dart';
import 'package:calculator_flutter/Helper/string_utils.dart';

class ResultProvider extends ChangeNotifier {
  String _resultValue = "123.456.789";

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
    setResultValue("%");
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
}
