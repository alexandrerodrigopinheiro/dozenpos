
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GridItemCustom extends StatelessWidget {
  const GridItemCustom({
    super.key, 
    required this.title,
    required this.icon, 
    required this.onPressed, 
  });

  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [ 
            BoxShadow(
              offset: const Offset(0, 5),
              color: GlobalColor.primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(
                icon, 
                size: 50,
                color: GlobalColor.primaryColor,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: GlobalColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),          
            ),
          ],
        ),
      ),
    );
  }
}
