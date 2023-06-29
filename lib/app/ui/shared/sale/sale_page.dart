import 'package:dozenpos/app/data/controllers/sale_controller.dart';
import 'package:dozenpos/app/ui/shared/sale/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/sale/widgets/dialog_purchase_custom.dart';
import 'package:dozenpos/app/ui/shared/sale/widgets/pickup_group_custom.dart';
import 'package:dozenpos/app/ui/shared/sale/widgets/pinput_group_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalePage extends GetView<SaleController> {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SafeArea(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  minHeight: MediaQuery.of(context).size.height,
                ),                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        BackButton(
                          color: GlobalColor.primaryColor,
                          onPressed: controller.goBack,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'rapidinha',
                            style: TextStyle(
                                color: GlobalColor.primaryColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Text(
                            'DATA: ${controller.date.value}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                        Obx(() {
                          return Text(
                            'CONCURSO: ${controller.code.value}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 15),
                    PinputGroupCustom(controllers: controller.controllerPinput),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 355,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            PickupGroupCustom(onPressed: controller.onPickup),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                  width: 58,
                                  child: ButtonCustom(
                                    text: '⌫',
                                    top: 0,
                                    fontSize: 20,
                                    onPressed: controller.onClean,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ButtonCustom(
                                    text: 'Surpresinha',
                                    onPressed: controller.onSurprise,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ButtonCustom(
                                    text: 'Comprar',
                                    onPressed: () => DialogPurchaseCustom(
                                      controllerName: controller.controllerName,
                                      controllerPhone: controller.controllerPhone,
                                      onPurchase: controller.onPurchase,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.isLoading.value,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.3),
                child: const SizedBox(
                  width: 55,
                  height: 55,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: GlobalColor.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
