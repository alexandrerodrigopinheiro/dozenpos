
import 'package:flutter/material.dart';

class PinputCustom extends StatelessWidget {
  const PinputCustom({
    super.key, 
    this.controller, 
    this.keyboardType,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 52,
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
          ),
        ],
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: keyboardType,
        readOnly: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}