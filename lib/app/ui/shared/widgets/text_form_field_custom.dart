
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key, 
    this.hintText, 
    this.controller, 
    this.keyboardType,
    this.obscureText = false,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15),
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
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintStyle: const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}