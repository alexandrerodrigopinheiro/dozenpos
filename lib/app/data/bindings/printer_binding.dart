import 'package:dozenpos/app/data/controllers/printer_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class PrinterBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => PrinterController());
}
