import 'package:intl/intl.dart';

extension StringUtils on String {
  String removeGroupSeparator() {
    return replaceAll(".", "");
  }

  String removeDecimalSeparator() {
    return replaceAll(",", "");
  }

  String removeDecimalDigits() {
    List<String> strList = split(",");
    if (strList.length > 0) {
      return strList.first;
    } else {
      return this;
    }
  }

  double formatToNumber() {
    double result = 0;
    String preparedValue = prepareBeforeDoubleParse();
    result = double.parse(preparedValue);
    return result;
  }

  String prepareBeforeDoubleParse() {
    replaceAll(".", "");
    return replaceAll(",", ".");
  }
}
