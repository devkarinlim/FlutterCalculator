import 'package:flutter/material.dart';
import 'package:calculator_flutter/Helper/string_utils.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class ResultProvider extends ChangeNotifier {
  String _resultValue = "123.456,789";
  String _resultCache = "0";
  double firstInput = 0;
  double secondInput = 0;
  int resetCount = 0;
  int equalTapCount = 0;
  OperationType _operationType = OperationType.none;
  bool isNumberInput = false;

  String get resultValue => _resultValue;

  void setResultValue(String value) {
    _resultValue = value;
    notifyListeners(); //trigger to rebuild widget who call builder method
  }

  void inputNumber(String title) {
    if (!_isAbleInput(_resultCache)) {
      return;
    }
    if (equalTapCount > 0) {
      _clearInput();
      if (title != ",") {
        _resultCache = title;
      }
    }
    if (_operationType != OperationType.none && _resultCache == "0") {
      _resultValue = _resultCache;
    }
    if (resultValue == "0" && title != ",") {
      _resultCache = "";
    } else if (resultValue == "-0" && title != ",") {
      _resultCache = "-";
    }
    if (!_resultValue.contains(",") && title == ",") {
      _resultCache += title;
    }
    if (title != ",") {
      _resultCache += title;
    }
    if (!_resultCache.contains(",")) {
      _resultValue = _formatResultToDecimal(_resultCache);
    } else {
      _resultValue = _resultCache;
    }
    notifyListeners();
    isNumberInput = true;
    resetCount = 0;
    //TODO: fix input number after equals operation, number still concat not replace
  }

  void _clearInput() {
    firstInput = 0;
    secondInput = 0;
    _operationType = OperationType.none;
    equalTapCount = 0;
    resetCount = 0;
  }

  bool _isAbleInput(String resultValue) {
    var result = false;
    var labelValue = resultValue.removeGroupSeparator();
    labelValue = labelValue.removeDecimalSeparator();
    labelValue = labelValue.removeNegationSign();
    if (labelValue.length < 9) {
      result = true;
    }
    return result;
  }

  void resetValue() {
    setResultValue("0");
    if (resetCount == 1) {
      _clearInput();
    } else {
      if (_operationType != OperationType.none) {
        secondInput = 0;
      }
      resetCount = 1;
    }
    _resultCache = "0";
    isNumberInput = false;
  }

  void negationToggle() {
    resetCount = 0;
    if (_resultValue.contains("-")) {
      _resultCache.replaceFirst("-", "");
    } else {
      _resultCache = "-$_resultCache";
    }
    setResultValue(_resultCache);
    if (equalTapCount > 0) {
      firstInput = resultValue.formatToNumber();
    }
  }

  void percentOperation() {
    double result = _resultCache.formatToNumber();
    result /= 100;
    var resultVal = _formatDecimalToString(result);
    setResultValue(_formatResultToDecimal(resultVal));
    if (equalTapCount > 0) {
      firstInput = _resultCache.formatToNumber();
    }
  }

  void divisionOperation() {
    //TODO: set button state and styling
    _setFirstInput(OperationType.division);
  }

  void multipleOperation() {
    //TODO: set button state and styling
    _setFirstInput(OperationType.multiple);
  }

  void minusOperation() {
    //TODO: set button state and styling
    _setFirstInput(OperationType.minus);
  }

  void plusOperation() {
    //TODO: set button state and styling
    _setFirstInput(OperationType.plus);
  }

  void equalOperation() {
    if (_operationType == OperationType.none) {
      equalTapCount = 0;
      return;
    }
    if (equalTapCount == 0) {
      secondInput = resultValue.formatToNumber();
    }
    switch (_operationType) {
      case OperationType.none:
        break;
      case OperationType.plus:
        _resultCache =
            (firstInput + secondInput).toString().formatDecimalSeparator();
        break;
      case OperationType.minus:
        _resultCache =
            (firstInput - secondInput).toString().formatDecimalSeparator();
        break;
      case OperationType.multiple:
        _resultCache =
            (firstInput * secondInput).toString().formatDecimalSeparator();
        break;
      case OperationType.division:
        if (firstInput == 1 && secondInput == 0) {
          _resultCache = "Error";
        } else {
          _resultCache =
              (firstInput / secondInput).toString().formatDecimalSeparator();
        }
    }
    setResultValue(_formatResultToDecimal(_resultCache));
    equalTapCount += 1;
    isNumberInput = false;
    firstInput = resultValue.formatToNumber();
  }

  String _formatDecimalToString(double calcResult) {
    if (calcResult == 0) {
      return "0";
    }
    var formatter = NumberFormat.decimalPattern("ID");
    formatter.minimumExponentDigits = 9;
    formatter.maximumFractionDigits = 10;

    return formatter.format(calcResult);
  }

  String _formatResultToDecimal(String resultValue) {
    if (resultValue == "Error") {
      return resultValue;
    }
    var formatter = NumberFormat("#,##0.00", "ID");
    formatter.maximumFractionDigits = 14;
    formatter.minimumFractionDigits = 0;
    _resultCache = formatter.format(resultValue
        .formatToNumber()); //TODO: fix method formatToNumber for exponent > 18
    return _convertResultToExponentOfTen(
        _resultCache); //TODO: format to exponent
  }

  String _convertResultToExponentOfTen(String resultValueStr) {
    var result = resultValueStr;
    var absValue = resultValueStr.removeNegationSign();
    if (absValue.contains(".")) {
      absValue = absValue.removeDecimalDigits();
      if (absValue.removeGroupSeparator().length > 9) {
        result = _getPositiveExponentFormat(absValue);
      }
    } else {
      if (absValue.removeDecimalSeparator().length > 9) {
        result = _getNegativeExponentFormat(absValue);
      }
    }
    return result;
  }

  void _setFirstInput(OperationType typeOperation) {
    if (isNumberInput && _operationType != OperationType.none) {
      equalOperation();
    }
    if (_operationType == OperationType.none) {
      firstInput = _resultCache.formatToNumber();
    }
    _operationType = typeOperation;
    equalTapCount = 0;
    _resultCache = "0";
    resetCount = 0;
    isNumberInput = false;
  }

  String _getPositiveExponentFormat(String digitStr) {
    var numValue = digitStr.formatToNumber();
    var nPow = digitStr.removeGroupSeparator().length - 1;
    var divideByValue = pow(10, nPow);
    var decimalValue = numValue / divideByValue;
    var formatter = NumberFormat("#,##0.00", "ID");
    formatter.minimumFractionDigits = 0;
    var decimalValueStr =
        formatter.format(decimalValue).formatDecimalSeparator();
    return "${decimalValueStr}e$nPow";
    //TODO: Still bugs, multiple equal
  }

  String _getNegativeExponentFormat(String digitStr) {
    //TODO: format to negative exponent
    var numValue = digitStr.formatToNumber();
    var nPow = digitStr.removeDecimalSeparator().length - 1;
    var divideByValue = pow(10, nPow);
    var decimalValue = numValue * divideByValue;
    return _reformatDecimalValueStr(decimalValue, nPow);
  }

  String _reformatDecimalValueStr(double decimalValue, int nPow) {
    var formatter = NumberFormat("#,##0.00", "ID");
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    var n = nPow;
    var decValue = decimalValue;
    var decimalValueStr = formatter.format(decValue).formatDecimalSeparator();
    if (decimalValueStr.length > 1) {
      n -= decimalValueStr.length - 1;
      var newNPow = decimalValueStr.length - 1;
      if (n < 9) {
        formatter.maximumFractionDigits = 8;
        newNPow = nPow;
      }
      decValue /= pow(10, newNPow);
      decimalValueStr = formatter.format(decValue).formatDecimalSeparator();
    }
    if (n >= 9) {
      return "${decimalValueStr}e-$n";
    } else {
      return decimalValueStr;
    }
  }
}

enum OperationType { none, plus, minus, multiple, division }
