import 'package:dozenpos/app/data/controllers/option_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OptionBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => OptionController());
}
