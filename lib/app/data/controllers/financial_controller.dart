import 'dart:async';

import 'package:dozenpos/app/data/repositories/financial_repository.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FinancialController extends GetxController {
  final FinancialRepository _financialRepository = Get.find<FinancialRepository>();
  final TextEditingController _controllerDataRange = TextEditingController();
  final RxBool _isLoading = true.obs;
  final RxString _amountSale = '0'.obs;
  final RxString _saleValue = 'R\$ 0,00'.obs;
  final RxString _comissionValue = 'R\$ 0,00'.obs;
  final RxString _profileValue = 'R\$ 0,00'.obs;

  DateTime? _startDate;
  DateTime? _endDate;

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

  Future<void> onConfirm(start, end) async {
    if (_isLoading.value) {
      return;
    }

    _startDate = start;
    _endDate = end;
    String strData = _startDate.toString().split(' ')[0].replaceAll('-', '/');
    strData += ' até ';
    strData += _endDate.toString().split(' ')[0].replaceAll('-', '/');
    _controllerDataRange.text = strData;
  }

  Future<void> onClean() async {
    if (_isLoading.value) {
      return;
    }

    _startDate = null;
    _endDate = null;
    _controllerDataRange.text = '';
  }

  Future<void> onSearch() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      final finacial = await _financialRepository.find(ConstantsResource.user!.id!, _startDate!, _endDate!);

      _amountSale.value = finacial!.amount.toString();
      _saleValue.value = 'R\$ ${finacial.sale!.toStringAsFixed(2).replaceAll('.', ',')}';
      _comissionValue.value = 'R\$ ${finacial.comission!.toStringAsFixed(2).replaceAll('.', ',')}';
      _profileValue.value = 'R\$ ${finacial.profit!.toStringAsFixed(2).replaceAll('.', ',')}';

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  get isLoading => _isLoading;
  get controllerDataRange => _controllerDataRange;
  get amountSale => _amountSale;
  get saleValue => _saleValue;
  get comissionValue => _comissionValue;
  get profileValue => _profileValue;
}
