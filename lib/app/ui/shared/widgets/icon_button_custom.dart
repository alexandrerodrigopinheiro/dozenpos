
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    super.key, 
    required this.icon, 
    this.onPressed, 
    this.size,
  });

  final IconData? icon;
  final void Function()? onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        padding: const EdgeInsets.only(top: 3),
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
        child: Icon(
          icon,
          color: Colors.white,
          size: size ?? 16,
        ),
      ),
    );
  }
}