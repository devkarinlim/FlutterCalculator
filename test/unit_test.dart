import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_flutter/Helper/string_utils.dart';
import 'package:calculator_flutter/Provider/result_provider.dart';

void main() {
  group("string_utils.dart", () {
    test("removeGroupSeparator() replace '.' with ''", () {
      //given
      String testCase1 = "1.000.000";
      //when
      String testResult1 = testCase1.removeGroupSeparator();
      //then
      expect(testResult1, equals("1000000"));
    });

    test("removeDecimalSeparator() replace ',' with ''", () {
      //given
      String testCase1 = "1.000,000";
      //when
      String testResult1 = testCase1.removeDecimalSeparator();
      //then
      expect(testResult1, equals("1.000000"));
    });

    test(
      "formatDecimalSeparator() replace '.' with ','",
      () {
        //given
        String testCase1 = "0.000015";
        //when
        String testResult1 = testCase1.formatDecimalSeparator();
        //then
        expect(testResult1, equals("0,000015"));
      },
    );

    test(
      "removeDecimalDigits() remove ',' and all digits after ','",
      () {
        //given
        String testCase1 = "2500,000015";
        String testCase2 = "";
        //when
        String testResult1 = testCase1.removeDecimalDigits();
        String testResult2 = testCase2.removeDecimalDigits();
        //then
        expect(testResult1, equals("2500"));
        expect(testResult2, equals(""));
      },
    );

    test(
      "removeNegationSign() replace '-' with ''",
      () {
        //given
        String testCase1 = "-2500";
        //when
        String testResult1 = testCase1.removeNegationSign();
        //then
        expect(testResult1, equals("2500"));
      },
    );

    test(
      "formatToNumber() convert string to double",
      () {
        //given
        String testCase1 = "2.500.000,0015";
        String testCase2 = "hellow";
        //when
        double testResult2 = testCase2.formatToNumber();
        double testResult1 = testCase1.formatToNumber();

        //then
        expect(testResult1, equals(2500000.0015));
      },
    );

    test(
      "prepareBeforeDoubleParse() format group and decimal separator",
      () {
        //given
        String testCase1 = "2.500.000,0015";
        //when
        String testResult1 = testCase1.prepareBeforeDoubleParse();
        //then
        expect(testResult1, equals("2500000.0015"));
      },
    );
  });

  group("result_provider.dart", () {
    ResultProvider sut = ResultProvider();

    test(
      "get resultValue",
      () {
        expect(sut.resultValue, "0");
      },
    );
    test(
      "setResultValue(value)",
      () {
        //given
        String testCase = "apple";

        //when
        sut.setResultValue(testCase);

        //then
        expect(sut.resultValue, testCase);
      },
    );

    test(
      "clearInput()",
      () {
        //given
        sut.firstInput = 100;
        sut.secondInput = 200;
        sut.operationType = OperationType.plus;
        sut.equalTapCount = 10;
        sut.resetCount = 2;

        //when
        sut.clearInput();

        //then
        expect(sut.firstInput, 0);
        expect(sut.secondInput, 0);
        expect(sut.operationType, OperationType.none);
        expect(sut.equalTapCount, 0);
        expect(sut.resetCount, 0);
      },
    );

    test(
      "isAbleInput()",
      () {
        //given
        String testCase1 = "1.000";
        String testCase2 = "1.000.000.000";

        //when
        bool trueResult = sut.isAbleInput(testCase1);
        bool falseResult = sut.isAbleInput(testCase2);

        //then
        expect(trueResult, true);
        expect(falseResult, false);
      },
    );
  });
}
