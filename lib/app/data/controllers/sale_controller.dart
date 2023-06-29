import 'dart:async';
import 'dart:math';

import 'package:dozenpos/app/data/repositories/sale_repository.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/data/resources/printer_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/ui/shared/sale/prints/sale_print.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';


class SaleController extends GetxController {
  static const int _maximum = 20;
  final SaleRepository _saleRepository = Get.find<SaleRepository>();
  final List<TextEditingController> _controllerPinput = [];
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final PrinterResource _printerResource = Get.find<PrinterResource>();
  final SalePrint _salePrint = SalePrint();
  final List<int> _value = [];
  final RxBool _isLoading = true.obs;
  final RxString _code = ''.obs;
  final RxString _date = ''.obs;
  int _index = 0;


  @override
  void onInit() {
    _isLoading(true);

    for (var i = 0; i < _maximum; i++) {
      _controllerPinput.add(TextEditingController());
      _value.add(0);
    }

    super.onInit();
  }

  @override
  void onReady() async {
    final contest = await _saleRepository.get();

    _code.value = contest!.code.toString();
    _date.value = '${contest.date!.split('-')[2]}/${contest.date!.split('-')[1]}/${contest.date!.split('-')[0]}';

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

  Future<void> onPickup(String value) async {
    if (_isLoading.value) {
      return;
    }

    if (_index < _maximum) {
      _value[_index] = int.parse(value);
      _controllerPinput[_index].text = value;
      _index = clampDouble(_index + 1, 0, 1.0 + _maximum.toDouble()).toInt();
    }
  }

  Future<void> onClean() async {
    if (_isLoading.value) {
      return;
    }

    _controllerName.text = '';
    _controllerPhone.text = '';

    for (var i = 0; i < _maximum; i++) {
      _value[i] = 0;
      _controllerPinput[i].text = '';
    }
    _index = 0;
  }

  Future<void> onSurprise() async {
    if (_isLoading.value) {
      return;
    }

    if (_index < _maximum) {
      int min = 1;
      int max = 50;
      Random random = Random();
      for (var i = 0; i < _maximum; i++) {
        _value[i] = min + random.nextInt(max);
        _controllerPinput[i].text = _value[i].toString();
      }
      _index = _maximum;
    }
  }

  Future<void> onPurchasePrint() async {
   if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      String numbers = ' ';
      for (int i = 0; i < _controllerPinput.length; i++) {
        numbers += _controllerPinput[i].text.padLeft(2, '0').padRight(3, ' ');
      }
      numbers.trim();

      if (_index != _maximum) {
        throw Utils.onThrow('Preencha seu palpite');
      }

      final ticket = await _saleRepository.purchase(ConstantsResource.user!.id!, numbers, _controllerName.text, _controllerPhone.text);

      // Clear
      _controllerName.text = '';
      _controllerPhone.text = '';

      for (var i = 0; i < _maximum; i++) {
        _value[i] = 0;
        _controllerPinput[i].text = '';
      }
      _index = 0;

      // Draw
      _salePrint.draw(_printerResource, ticket!);

      Notifications.success('SUCESSO', 'Aposta realizada com sucesso!');

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onPurchaseWhats() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      if (_controllerPhone.text.isEmpty) {
          throw Utils.onThrow('O telefone precisa estar preenchido com o DDD');
      }

      final isInstalled = await WhatsappShare.isInstalled(package: Package.businessWhatsapp);
      if (!isInstalled!) {
          throw Utils.onThrow('O whatsapp deve estar instalado');
      }

      String numbers = ' ';
      for (int i = 0; i < _controllerPinput.length; i++) {
        numbers += _controllerPinput[i].text.padLeft(2, '0').padRight(3, ' ');
      }
      numbers.trim();

      if (_index != _maximum) {
        throw Utils.onThrow('Preencha seu palpite');
      }

      final ticket = await _saleRepository.purchase(ConstantsResource.user!.id!, numbers, _controllerName.text, _controllerPhone.text);

      // Whats
      String message = '```';
      message += '''
${ticket!.title!.toUpperCase()}
${ticket.owner!.toUpperCase()}
${Utils.toDateTime(DateTime.now(), link: ' ')}
------------------------------------
CONCURSO: ${ticket.contest!.toString()}
BILHETE: ${ticket.code!.toString()}
DATA: ${Utils.toDate(ticket.date!)}
HORA: ${ticket.time!}
VALOR: R\$${ticket.value!.toStringAsFixed(2).replaceAll('.', ',')}
PREMIO: R\$${ticket.prize!.toStringAsFixed(2).replaceAll('.', ',')}
------------------------------------
${ticket.numbers!.toUpperCase().replaceAll(',', ' ')}
------------------------------------
N: ${ticket.name ?? ''}
T: ${ticket.phone ?? ''}
------------------------------------
${ticket.observation!.toUpperCase()}
''';
      message += '```';

      final String phone = '55${_controllerPhone.text.toString().replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', '')}';

      await WhatsappShare.share(text: message, phone: phone);

      // Clear
      _controllerName.text = '';
      _controllerPhone.text = '';

      for (var i = 0; i < _maximum; i++) {
        _value[i] = 0;
        _controllerPinput[i].text = '';
      }
      _index = 0;

      Notifications.success('SUCESSO', 'Aposta realizada com sucesso!');

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onPurchaseWhatsAndPrint() async {
   if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      String numbers = ' ';
      for (int i = 0; i < _controllerPinput.length; i++) {
        numbers += _controllerPinput[i].text.padLeft(2, '0').padRight(3, ' ');
      }
      numbers.trim();

      if (_index != _maximum) {
        throw Utils.onThrow('Preencha seu palpite');
      }

      final ticket = await _saleRepository.purchase(ConstantsResource.user!.id!, numbers, _controllerName.text, _controllerPhone.text);

      // Draw
      _salePrint.draw(_printerResource, ticket!);

      // Whats
      final isInstalled = await WhatsappShare.isInstalled(package: Package.businessWhatsapp);

      if (_controllerPhone.text.isNotEmpty && isInstalled!) {
        String message = '```';
        message += '''
${ticket.title!.toUpperCase()}
${ticket.owner!.toUpperCase()}
${Utils.toDateTime(DateTime.now(), link: ' ')}
------------------------------------
CONCURSO: ${ticket.contest!.toString()}
BILHETE: ${ticket.code!.toString()}
DATA: ${Utils.toDate(ticket.date!)}
HORA: ${ticket.time!}
VALOR: R\$${ticket.value!.toStringAsFixed(2).replaceAll('.', ',')}
PREMIO: R\$${ticket.prize!.toStringAsFixed(2).replaceAll('.', ',')}
------------------------------------
${ticket.numbers!.toUpperCase().replaceAll(',', ' ')}
------------------------------------
N: ${ticket.name ?? ''}
T: ${ticket.phone ?? ''}
------------------------------------
${ticket.observation!.toUpperCase()}
''';
        message += '```';

        final String phone = '55${_controllerPhone.text.toString().replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', '')}';

        await WhatsappShare.share(text: message, phone: phone);
      }

      // Clear
      _controllerName.text = '';
      _controllerPhone.text = '';

      for (var i = 0; i < _maximum; i++) {
        _value[i] = 0;
        _controllerPinput[i].text = '';
      }
      _index = 0;

      Notifications.success('SUCESSO', 'Aposta realizada com sucesso!');

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  get isLoading => _isLoading;
  get code => _code;
  get date => _date;
  get controllerPinput => _controllerPinput;
  get controllerName => _controllerName;
  get controllerPhone => _controllerPhone;
}
