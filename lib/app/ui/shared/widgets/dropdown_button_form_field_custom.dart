import 'package:flutter/material.dart';

class DropdownButtonFormFieldCustom<T> extends StatelessWidget {
  const DropdownButtonFormFieldCustom({
    Key? key,
    required this.value,
    this.padding = EdgeInsets.zero,
    required this.selectedItemBuilder,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final dynamic value;
  final EdgeInsetsGeometry padding;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            ),
            contentPadding: const EdgeInsets.only(left: 18, right: 26),
          ),
          isExpanded: true,
          isDense: true,
          value: value,
          selectedItemBuilder: selectedItemBuilder,
          items: items,
          dropdownColor: Colors.white,
          onChanged: onChanged!,
        ),
      ),
    );
  }
}
