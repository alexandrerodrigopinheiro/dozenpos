import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPurchaseCustom {
  final void Function()? onPurchase;
  final TextEditingController? controllerName;
  final TextEditingController? controllerPhone;

  DialogPurchaseCustom({
    required this.onPurchase,
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
              text: 'Comprar',
              onPressed: () {
                Get.back();
                onPurchase!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
