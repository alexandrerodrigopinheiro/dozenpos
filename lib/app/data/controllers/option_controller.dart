import 'dart:async';

import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OptionController extends GetxController {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
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

  Future<void> sale() async => await Utils.goCleaning(Routes.sale);

  Future<void> financial() async => await Utils.goCleaning(Routes.financial);

  Future<void> profile() async => await Utils.goCleaning(Routes.profile);

  get isLoading => _isLoading;
  get controllerUsername => _controllerUsername;
  get controllerPassword => _controllerPassword;
}
