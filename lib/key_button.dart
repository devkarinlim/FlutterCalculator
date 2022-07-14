import 'package:calculator_flutter/app_theme.dart';
import 'package:flutter/material.dart';

class KeyButton extends StatefulWidget {
  final int widthPortion;
  final String title;
  final IconData? icon;
  final Color titleColor;
  final Color backgroundColor;
  final Function() onTap;
  final bool isTitleIcon;

  const KeyButton({Key? key, required this.widthPortion, required this.title, required this.titleColor, required this.backgroundColor, required this.onTap, required this.isTitleIcon, this.icon}) : super(key: key);

  @override
  State<KeyButton> createState() => _KeyButtonState();
}

class _KeyButtonState extends State<KeyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(100)
          ),
          child: FittedBox(
            child: 
            !widget.isTitleIcon 
            ? Text(
              widget.title,
              style: TextStyle(color: widget.titleColor, fontWeight: AppTheme.buttonTitleWeight, fontFamily: AppTheme.buttonFontFamily),
            )
            :
            Icon(
              widget.icon,
              color: widget.titleColor,
            )
          ),
        ),
    );
  }
}
