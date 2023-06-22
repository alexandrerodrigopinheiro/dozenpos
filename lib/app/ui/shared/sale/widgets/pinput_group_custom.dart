
import 'package:dozenpos/app/ui/shared/widgets/pinput_custom.dart';
import 'package:flutter/material.dart';

class PinputGroupCustom extends StatelessWidget {
  const PinputGroupCustom({
    super.key, 
    required this.controllers,
  });

  final List<TextEditingController?> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PinputCustom(
              controller: controllers[0],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[1],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[2],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[3],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[4],
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PinputCustom(
              controller: controllers[5],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[6],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[7],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[8],
              keyboardType: TextInputType.number,
            ),
            PinputCustom(
              controller: controllers[9],
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ],
    );
  }
}
