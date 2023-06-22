import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPurchaseCustom {
  final void Function()? onPurchasePrint;
  final void Function()? onPurchaseWhats;
  final void Function()? onPurchaseWhatsAndPrint;
  final TextEditingController? controllerName;
  final TextEditingController? controllerPhone;

  DialogPurchaseCustom({
    required this.onPurchasePrint,
    required this.onPurchaseWhats,
    required this.onPurchaseWhatsAndPrint,
    required this.controllerName, 
    required this.controllerPhone, 
  }) {
    Get.defaultDialog(
      title: '',
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(fontSize: 0),
      contentPadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      titlePadding: EdgeInsets.zero,
      barrierDismissible: false,
      cancel: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ButtonCustom(
          text: 'Cancelar',
          onPressed: () => Get.back(),
        ),
      ),
      radius: 6,
      content: Form(
        child: Column(
          children: [
            TextFormFieldCustom(
              controller: controllerName,
              hintText: 'Nome',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormFieldCustom(
              controller: controllerPhone,
              hintText: 'Telefone',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            ButtonCustom(
              text: 'Comprar: Impr.',
              onPressed: () {
                Get.back();
                onPurchasePrint!();
              },
            ),
            const SizedBox(height: 15),
            ButtonCustom(
              text: 'Comprar: Whats',
              onPressed: () {
                Get.back();
                onPurchaseWhats!();
              },
            ),
            const SizedBox(height: 15),
            ButtonCustom(
              text: 'Comprar: Impr. e Whats',
              onPressed: () {
                Get.back();
                onPurchaseWhatsAndPrint!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
