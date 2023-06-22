import 'package:dozenpos/app/data/controllers/profile_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => ProfileController());
}
