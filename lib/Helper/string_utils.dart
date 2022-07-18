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
    if (strList.isNotEmpty) {
      return strList.first;
    } else {
      return this;
    }
  }

  String removeNegationSign() {
    return replaceAll("-", "");
  }

  double formatToNumber() {
    double result = 0;
    String preparedValue = prepareBeforeDoubleParse();
    try {
      result = double.parse(preparedValue);
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
