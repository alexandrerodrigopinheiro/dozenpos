import 'package:dozenpos/app/data/controllers/financial_controller.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/icon_button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinancialPage extends GetView<FinancialController> {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                      ],
                    ),
                    const Text(
                      'Escolha o período para a consulta',
                      style: TextStyle(
                        color: GlobalColor.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldCustom(
                            controller: controller.controllerDataRange,
                            hintText: 'Período',
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 55,
                          child: IconButtonCustom(
                            icon: Icons.search,
                            size: 25,
                            onPressed: () => DateTimeRangePicker(
                              startText: 'De',
                              endText: 'Ate',
                              doneText: 'Ok',
                              cancelText: 'Cancelar',
                              interval: 5,
                              initialStartTime: DateTime.now(),
                              initialEndTime: DateTime.now(),
                              mode: DateTimeRangePickerMode.date,
                              minimumTime: DateTime.now().subtract(const Duration(days: 365*100)),
                              maximumTime: DateTime.now().add(const Duration(days: 365*100)),
                              use24hFormat: true,
                              onConfirm: controller.onConfirm,
                              onCancel: controller.onClean,
                            ).showPicker(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ButtonCustom(
                      text: 'Buscar',
                      onPressed: controller.onSearch,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantidade',
                          style: TextStyle(
                            color: GlobalColor.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            controller.amountSale.value,
                            style: const TextStyle(
                              color: GlobalColor.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vendas',
                          style: TextStyle(
                            color: GlobalColor.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            controller.saleValue.value,
                            style: const TextStyle(
                              color: GlobalColor.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Comissão',
                          style: TextStyle(
                            color: GlobalColor.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            controller.comissionValue.value,
                            style: const TextStyle(
                              color: GlobalColor.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lucro',
                          style: TextStyle(
                            color: GlobalColor.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            controller.profileValue.value,
                            style: const TextStyle(
                              color: GlobalColor.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
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
      ),
    );
  }
}
