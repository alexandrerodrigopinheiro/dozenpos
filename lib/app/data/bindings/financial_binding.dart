import 'package:dozenpos/app/data/controllers/financial_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class FinancialBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => FinancialController());
}
