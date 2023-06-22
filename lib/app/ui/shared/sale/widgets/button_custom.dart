
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key, 
    required this.text, 
    this.onPressed, 
    this.fontSize,
    this.top,
  });

  final String text;
  final void Function()? onPressed;
  final double? fontSize;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        padding: EdgeInsets.only(top: top ?? 2),
        decoration: BoxDecoration(
          color: GlobalColor.primaryColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}