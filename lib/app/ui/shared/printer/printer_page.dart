import 'package:dozenpos/app/data/controllers/printer_controller.dart';
import 'package:dozenpos/app/data/models/print_type_model.dart';
import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/dropdown_button_form_field_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrinterPage extends GetView<PrinterController> {
  const PrinterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
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
                          child: const Text(
                            'rapidinha',
                            style: TextStyle(
                              color: GlobalColor.primaryColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Escolha o formato e a impressora',
                      style: TextStyle(
                        color: GlobalColor.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        SizedBox(
                          height: 55,
                          child: Obx(() {
                            return DropdownButtonFormFieldCustom<PrintTypeModel>(
                              value: controller.printType.value,
                              selectedItemBuilder: (BuildContext context) {
                                return List<DropdownMenuItem<PrintTypeModel>>.generate(controller.printTypes.length, (index) {
                                  return DropdownMenuItem(
                                    value: controller.printTypes[index],
                                    child: Text(controller.printTypes[index].name),
                                  );
                                });
                              },
                              items: List<DropdownMenuItem<PrintTypeModel>>.generate(controller.printTypes.length, (index) {
                                return DropdownMenuItem(
                                  value: controller.printTypes[index],
                                  child: Text(controller.printTypes[index].name),
                                );
                              }),
                              onChanged: controller.onType,
                            );
                          }),
                        ),
                        SizedBox(
                          height: 55,
                          child: Obx(() {
                            return DropdownButtonFormFieldCustom<BluetoothDevice>(
                              value: controller.device.value,
                              selectedItemBuilder: (BuildContext context) {
                                return List<DropdownMenuItem<BluetoothDevice>>.generate(controller.devices.length, (index) {
                                  return DropdownMenuItem(
                                    value: controller.devices[index],
                                    child: Text(controller.devices[index].name),
                                  );
                                });
                              },
                              items: List<DropdownMenuItem<BluetoothDevice>>.generate(controller.devices.length, (index) {
                                return DropdownMenuItem(
                                  value: controller.devices[index],
                                  child: Text(controller.devices[index].name),
                                );
                              }),
                              onChanged: controller.onDevice,
                            );
                          }),
                        ),
                        Obx(() {
                          return ButtonCustom(
                            text: controller.isConneced.value ? 'Desconectar' : 'Conectar',
                            onPressed: controller.isConneced.value ? controller.onDesconnect : controller.onConnect,
                          );
                        }),
                      ],
                    ),
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
      floatingActionButton: SizedBox(
        width: 55,
        height: 55,
        child: FloatingActionButton(
          backgroundColor: GlobalColor.primaryColor,
          elevation: 1.0,
          onPressed: controller.onRefresh,
          child: const Icon(
            Icons.refresh,
            size: 30,
          ),
        ),
      ),
    );
  }
}
