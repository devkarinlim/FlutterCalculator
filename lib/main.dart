import 'package:calculator_flutter/app_theme.dart';
import 'package:calculator_flutter/key_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "SFProTextThin"),
      home: const CalculatorBody(),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

String resultValue = "123.456.789";

class _CalculatorBodyState extends State<CalculatorBody> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1, 
                child: ResultWidget(resultLabel: resultValue),
              ),
              const Expanded(
                flex: 2,
                child: KeypadWidget()
              ) 
            ],
          ),
        )
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({required this.resultLabel, super.key});

  final String resultLabel;

  @override
  // ignore: library_private_types_in_public_api
  _ResultWidgetState createState() => _ResultWidgetState();

}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(16),
      // child: FittedBox(alignment: Alignment.bottomRight,child: Text(widget.resultLabel, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.right),)
      child: FittedBox(alignment: Alignment.bottomRight,child: AutoSizeText(widget.resultLabel, textAlign: TextAlign.right, maxLines: 2, minFontSize: 64, maxFontSize: 96, style: TextStyle(color: AppTheme.lightTintColor),))
    );
  }
}

class KeypadWidget extends StatefulWidget {
  const KeypadWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KeypadWidgetState createState() => _KeypadWidgetState();
}

class _KeypadWidgetState extends State<KeypadWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      padding: const EdgeInsets.all(16),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, 
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
        children: [
          KeyButton(
            widthPortion: 1, 
            title: "AC", 
            titleColor: AppTheme.darkTintColor, 
            backgroundColor: AppTheme.lightGrey, 
            onTap: resetButtonTap, 
            isTitleIcon: false),
          KeyButton(
            widthPortion: 1, 
            title: "+/-", 
            titleColor: AppTheme.darkTintColor, 
            backgroundColor: AppTheme.lightGrey, 
            onTap: negationTap, 
            isTitleIcon: false),
          KeyButton(
            widthPortion: 1, 
            title: "%", 
            titleColor: AppTheme.darkTintColor, 
            backgroundColor: AppTheme.lightGrey, 
            onTap: percentageTap, 
            isTitleIcon: false),
          KeyButton(
            widthPortion: 1, 
            title: "/", 
            titleColor: AppTheme.lightTintColor, 
            backgroundColor: AppTheme.orange, 
            onTap: divisionTap, 
            isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "7", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "8", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "9", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "x", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.orange, 
              onTap: multipleTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "4", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "5", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "6", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "-", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.orange, 
              onTap: minusTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "1", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "2", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "3", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "+", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.orange, 
              onTap: plusTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 2, 
              title: "0", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: ",", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.darkGrey, 
              onTap: numberButtonTap, 
              isTitleIcon: false),
            KeyButton(
              widthPortion: 1, 
              title: "=", 
              titleColor: AppTheme.lightTintColor, 
              backgroundColor: AppTheme.orange, 
              onTap: equalTap, 
              isTitleIcon: false),
        ],
      
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "AC", 
      //           titleColor: AppTheme.darkTintColor, 
      //           backgroundColor: AppTheme.lightGrey, 
      //           onTap: resetButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "+/-", 
      //           titleColor: AppTheme.darkTintColor, 
      //           backgroundColor: AppTheme.lightGrey, 
      //           onTap: negationTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "%", 
      //           titleColor: AppTheme.darkTintColor, 
      //           backgroundColor: AppTheme.lightGrey, 
      //           onTap: percentageTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "/", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.orange, 
      //           onTap: divisionTap, 
      //           isTitleIcon: false),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "7", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "8", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "9", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "x", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.orange, 
      //           onTap: multipleTap, 
      //           isTitleIcon: false),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "4", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "5", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "6", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "-", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.orange, 
      //           onTap: minusTap, 
      //           isTitleIcon: false),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "1", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "2", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "3", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "+", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.orange, 
      //           onTap: plusTap, 
      //           isTitleIcon: false),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         KeyButton(
      //           widthPortion: 2, 
      //           title: "0", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: ",", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.darkGrey, 
      //           onTap: numberButtonTap, 
      //           isTitleIcon: false),
      //         KeyButton(
      //           widthPortion: 1, 
      //           title: "=", 
      //           titleColor: AppTheme.lightTintColor, 
      //           backgroundColor: AppTheme.orange, 
      //           onTap: equalTap, 
      //           isTitleIcon: false),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

void resetButtonTap(){
  print("Reset button test");
}

void negationTap(){
  print("Negation Button Tap");
}

void percentageTap(){
  print("Percentage Button Tap");
}

void divisionTap(){
  print("Division Button Tap");
}

void multipleTap(){
  print("Multiple Button Tap");
}

void minusTap(){
  print("Minus Button Tap");
}

void plusTap(){
  print("Plus Button Tap");
}

void equalTap(){
  print("Equal Button Tap");
}

void numberButtonTap(){
  print("Number Button Tap");
}


