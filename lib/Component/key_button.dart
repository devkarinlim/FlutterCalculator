import 'package:calculator_flutter/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KeyButton extends StatefulWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Function() onTap;
  final bool isTitleIcon;
  final double padding;
  final String? assetPath;

  const KeyButton(
      {Key? key,
      required this.title,
      required this.titleColor,
      required this.backgroundColor,
      required this.onTap,
      required this.isTitleIcon,
      required this.padding,
      this.assetPath})
      : super(key: key);

  @override
  State<KeyButton> createState() => _KeyButtonState();
}

class _KeyButtonState extends State<KeyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {widget.onTap()}),
      child: Container(
        padding: widget.isTitleIcon
            ? EdgeInsets.all(widget.padding * 2)
            : EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(100)),
        child: FittedBox(
            child: !widget.isTitleIcon
                ? Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.titleColor,
                        fontWeight: AppTheme.buttonTitleWeight,
                        fontFamily: AppTheme.buttonFontFamily),
                  )
                : SvgPicture.asset(widget.assetPath!,
                    color: widget.titleColor)),
      ),
    );
  }
}
