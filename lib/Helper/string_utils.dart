import 'package:decimal/decimal.dart';

extension StringUtils on String {
  String removeGroupSeparator() {
    return replaceAll(".", "");
  }

  String removeDecimalSeparator() {
    return replaceAll(",", "");
  }

  String formatDecimalSeparator() {
    return replaceAll(".", ",");
  }

  String removeDecimalDigits() {
    List<String> strList = split(",");
    return strList.first;
  }

  String removeNegationSign() {
    return replaceAll("-", "");
  }

  double formatToNumber() {
    double result = 0;
    String preparedValue = prepareBeforeDoubleParse();
    try {
      result = Decimal.parse(preparedValue).toDouble();
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  String prepareBeforeDoubleParse() {
    String newValue = replaceAll(".", "");
    return newValue.replaceAll(",", ".");
  }
}
