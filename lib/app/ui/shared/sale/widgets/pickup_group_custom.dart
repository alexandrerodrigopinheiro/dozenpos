
import 'package:dozenpos/app/ui/shared/widgets/pickup_custom.dart';
import 'package:flutter/material.dart';

class PickupGroupCustom extends StatelessWidget {
  const PickupGroupCustom({
    super.key,
    required this.onPressed,
  });

  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickupCustom(
              text: '1',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '2',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '3',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '4',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '5',
              onPressed: onPressed,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickupCustom(
              text: '6',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '7',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '8',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '9',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '10',
              onPressed: onPressed,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickupCustom(
              text: '11',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '12',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '13',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '14',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '15',
              onPressed: onPressed,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickupCustom(
              text: '16',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '17',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '18',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '19',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '20',
              onPressed: onPressed,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickupCustom(
              text: '21',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '22',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '23',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '24',
              onPressed: onPressed,
            ),
            PickupCustom(
              text: '25',
              onPressed: onPressed,
            ),
          ],
        ),
      ],
    );
  }
}
