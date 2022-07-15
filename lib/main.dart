import 'package:calculator_flutter/Provider/result_provider.dart';
import 'package:calculator_flutter/Theme/app_theme.dart';
import 'package:calculator_flutter/Component/key_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

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
      child: ChangeNotifierProvider(
        create: (_) => ResultProvider(),
        child: Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Expanded(
                flex: 1,
                child: ResultWidget(),
              ),
              Expanded(flex: 2, child: KeypadWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(
        builder: (context, resultProvider, child) => Container(
            color: AppTheme.backgroundColor,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: FittedBox(
                alignment: Alignment.bottomRight,
                child: AutoSizeText(
                  resultProvider.resultValue,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  minFontSize: 96,
                  maxFontSize: 128,
                  style: TextStyle(color: AppTheme.lightTintColor),
                ))));
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
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: MediaQuery.of(context).size.width / 32,
        crossAxisSpacing: MediaQuery.of(context).size.width / 32,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "AC",
                titleColor: AppTheme.darkTintColor,
                backgroundColor: AppTheme.lightGrey,
                onTap: () => resetButtonTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyButton(
                  title: "+/-",
                  titleColor: AppTheme.darkTintColor,
                  backgroundColor: AppTheme.lightGrey,
                  onTap: () => negationTap(context),
                  isTitleIcon: false)),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "%",
                titleColor: AppTheme.darkTintColor,
                backgroundColor: AppTheme.lightGrey,
                onTap: () => percentageTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "/",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.orange,
                onTap: () => divisionTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "7",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "7"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "8",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "8"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "9",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "9"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "x",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.orange,
                onTap: () => multipleTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "4",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "4"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "5",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "5"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "6",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "6"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "-",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.orange,
                onTap: () => minusTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "1",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "1"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "2",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "2"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "3",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "3"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "+",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.orange,
                onTap: () => plusTap(context),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "0",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, "0"),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: ",",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.darkGrey,
                onTap: () => numberButtonTap(context, ","),
                isTitleIcon: false),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyButton(
                title: "=",
                titleColor: AppTheme.lightTintColor,
                backgroundColor: AppTheme.orange,
                onTap: () => equalTap(context),
                isTitleIcon: false),
          ),
        ],
      ),
    );
  }
}

void resetButtonTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).resetValue();
}

void negationTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).negationToggle();
}

void percentageTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).percentOperation();
}

void divisionTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).divisionOperation();
}

void multipleTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).multipleOperation();
}

void minusTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).minusOperation();
}

void plusTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).plusOperation();
}

void equalTap(BuildContext context) {
  Provider.of<ResultProvider>(context, listen: false).equalOperation();
}

void numberButtonTap(BuildContext context, String title) {
  Provider.of<ResultProvider>(context, listen: false).inputNumber(title);
}
