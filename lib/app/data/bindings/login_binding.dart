import 'package:dozenpos/app/data/controllers/login_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginController());
}
