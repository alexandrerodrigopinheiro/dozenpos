// import 'package:dozenpos/app/data/providers/login_provider.dart';
// import 'package:get/get.dart';

import 'package:dozenpos/app/data/models/login_model.dart';
import 'package:dozenpos/app/data/providers/login_provider.dart';
import 'package:get/get.dart';

class LoginRepository {
  final _loginProvider = Get.find<LoginProvider>();

  Future<LoginModel?> login(String username, String password) async => await _loginProvider.login(username, password);
}
