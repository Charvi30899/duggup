import 'package:duggup/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double radius;
  final double hg;
  final Color btnColor;
  final Color borderColor;
  final String title;
  final FontWeight fontw;
  final double fontSize;
  final Color fontColor;
  final Function onClick;
  const CustomButton({
    super.key,
    required this.radius,
    required this.hg,
    required this.borderColor,
    required this.btnColor,
    required this.title,
    required this.fontColor,
    required this.fontSize,
    required this.fontw,
    required this.onClick,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        height: widget.hg,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: widget.btnColor,
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Center(
            child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: widget.fontw,
            color: widget.fontColor,
            fontSize: widget.fontSize,
          ),
        )),
      ),
    );
  }
}
