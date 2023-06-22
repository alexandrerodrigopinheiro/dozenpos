import 'dart:async';

import 'package:dozenpos/app/data/repositories/login_repository.dart';
import 'package:dozenpos/app/data/models/print_type_model.dart';
import 'package:dozenpos/app/data/models/printer_model.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/data/resources/printer_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final LoginRepository _loginRepository = Get.find<LoginRepository>();
  final PrinterResource _printerResource = Get.find<PrinterResource>();
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
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

    if (!_printerResource.hasImage()) {
      /*
       * read and write
       * image max 300px X 300px
       */
      // final filename = 'oryx_terminal_printer.png';
      // var bytes = await rootBundle.load("assets/images/oryx/oryx_terminal_printer.png");
      // String dir = (await getApplicationDocumentsDirectory()).path;
      // File('$dir/$filename').writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.buffer.lengthInBytes));
      // _printerResource.setImage(_key, '$dir/$filename');
    }

    try {
      // bool? isConnected = await _bluetooth.isConnected;

      if (await _printerResource.hasPrinter()) {
        final PrinterModel? printerModel = await _printerResource.getPrinter();
        _printerResource.setDevice(BluetoothDevice(printerModel!.name, printerModel.address));
        _printerResource.setPrintType(PrintTypeModel(name: printerModel.type));

        _bluetooth.isConnected.then((connected) async {
          if (!connected!) {
            await _bluetooth.connect(_printerResource.device).catchError((error) async => _printerResource.isConnected(false));
            _printerResource.isConnected(true);
          }
        });
      }

      _bluetooth.onStateChanged().listen((state) {
        switch (state) {
          case BlueThermalPrinter.CONNECTED:
            _printerResource.isConnected(true);
            break;
          case BlueThermalPrinter.DISCONNECTED:
            _printerResource.isConnected(false);
            break;
          default: break;
        }
      });

      _isLoading(false);
    } on PlatformException {
      _isLoading(false);
    }
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
