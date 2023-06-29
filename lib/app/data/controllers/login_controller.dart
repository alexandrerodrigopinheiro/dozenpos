import 'dart:async';

import 'package:dozenpos/app/data/repositories/login_repository.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final LoginRepository _loginRepository = Get.find<LoginRepository>();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final RxBool _isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    _onInit();
  }

  @override
  void onReady() {
    _isLoading(false);

    super.onReady();
  }

  void _onInit() async {
    _isLoading(true);
  }

  @override
  Future<void> onClose() async {
    _isLoading(false);

    return super.onClose();
  }
 
  Future<void> onLogin() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      ConstantsResource.user = await _loginRepository.login(_controllerUsername.text, _controllerPassword.text);

      await Utils.goCleaning(Routes.option);

      Notifications.success('SUCESSO', 'Seja bem vindo!');

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  get isLoading => _isLoading;
  get controllerUsername => _controllerUsername;
  get controllerPassword => _controllerPassword;
}
