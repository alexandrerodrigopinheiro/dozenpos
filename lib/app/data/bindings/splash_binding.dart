import 'package:dozenpos/app/data/controllers/splash_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SplashController());
}
