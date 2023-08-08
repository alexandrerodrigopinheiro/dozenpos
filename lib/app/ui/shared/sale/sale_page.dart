import 'package:dozenpos/app/data/controllers/sale_controller.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
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
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
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
                        child: Text(
                          ConstantsResource.appName.toUpperCase(),
                          style: const TextStyle(
                            color: GlobalColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Row(
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
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
                                    onPurchasePrint: controller.onPurchasePrint,
                                    onPurchaseWhats: controller.onPurchaseWhats,
                                    onPurchaseWhatsAndPrint:
                                        controller.onPurchaseWhatsAndPrint,
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
