import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const DividerCustom({
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(
        height: 0,
        color: GlobalColor.secondaryColor.withOpacity(0.5),
      ),
    );
  }
}
