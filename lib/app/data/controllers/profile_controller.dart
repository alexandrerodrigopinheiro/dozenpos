import 'dart:async';

import 'package:dozenpos/app/data/repositories/profile_repository.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  final ProfileRepository _profileRepository = Get.find<ProfileRepository>();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerNewPassword = TextEditingController();
  final TextEditingController _controllerConfirmationPassword = TextEditingController();
  final RxBool _isLoading = true.obs;

  @override
  void onInit() {
    _isLoading(true);

    super.onInit();
  }

  @override
  void onReady() {
    _isLoading(false);

    super.onReady();
  }

  @override
  Future<void> onClose() async {
    _isLoading(false);

    return super.onClose();
  }
 
  Future<void> goBack() async {
    if (_isLoading.value) {
      return;
    }

    await Utils.goCleaning(Routes.option);
  }

  Future<void> onSave() async {
   if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      if (_controllerNewPassword.text != _controllerConfirmationPassword.text) {
        throw Utils.onThrow('As senhas não conferem');
      }

      if (_controllerNewPassword.text.isEmpty || _controllerConfirmationPassword.text.isEmpty) {
        throw Utils.onThrow('As novas senhas precisão estar preenchidas');
      }

      if (_controllerPassword.text.isEmpty) {
        throw Utils.onThrow('A senha antiga precisa estar preenchida');
      }

      await _profileRepository.profile(ConstantsResource.user!.id!, _controllerPassword.text, _controllerNewPassword.text);

      _controllerPassword.text = '';
      _controllerNewPassword.text = '';
      _controllerConfirmationPassword.text = '';

      Notifications.success('SUCESSO', 'Perfil atualizado com sucesso!');

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  get isLoading => _isLoading;
  get controllerPassword => _controllerPassword;
  get controllerNewPassword => _controllerNewPassword;
  get controllerConfirmationPassword => _controllerConfirmationPassword;
}
