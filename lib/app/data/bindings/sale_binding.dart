import 'package:dozenpos/app/data/controllers/sale_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SaleController());
}
