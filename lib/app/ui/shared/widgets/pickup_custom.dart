
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PickupCustom extends StatelessWidget {
  const PickupCustom({
    super.key, 
    required this.text, 
    required this.onPressed, 
  });

  final String text;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(text),
      child: Container(
        alignment: Alignment.center,
        width: 58,
        height: 52,
        padding: const EdgeInsets.only(top: 2),
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}