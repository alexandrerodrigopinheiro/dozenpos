import 'dart:async';

import 'package:dozenpos/app/data/models/printer_model.dart';
import 'package:dozenpos/app/data/models/print_type_model.dart';
import 'package:dozenpos/app/data/resources/printer_resource.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/components/notifications.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class PrinterController extends GetxController {
  final PrinterResource _printerResource = Get.find<PrinterResource>();
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
  final RxList _printTypes = [].obs;
  final RxList _devices = [].obs;
  final Rx<PrintTypeModel> _printType = PrintTypeModel(name: 'Normal').obs;
  final Rx<BluetoothDevice> _device = BluetoothDevice('Selecione um dispositivo', '').obs;
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

  @override
  Future<void> onClose() async {
    _isLoading(false);

    return super.onClose();
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

      List<BluetoothDevice> devices = [];
      devices = await _bluetooth.getBondedDevices();

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

      _device.value = _printerResource.device;
      _devices.clear();
      _devices.add(BluetoothDevice('Selecione um dispositivo', ''));
      _devices.addAll(devices);
      _devices.refresh();

      _printType.value = _printerResource.printType;
      _printTypes.clear();
      _printTypes.add(PrintTypeModel(name: 'Normal'));
      _printTypes.add(PrintTypeModel(name: 'A930'));
      _printTypes.add(PrintTypeModel(name: 'GL-V1S'));
      _printTypes.refresh();

      _isLoading(false);
    } on PlatformException {
      _isLoading(false);
      Notifications.danger('ERRO', 'Nenhum dispositivo encotrado');
    }
  }

  Future<void> goBack() async {
    if (_isLoading.value) {
      return;
    }

    await Utils.goCleaning(Routes.option);
  }

  Future<void> onRefresh() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      bool? isConnected = await _bluetooth.isConnected;
      List<BluetoothDevice> devices = [];
      devices = await _bluetooth.getBondedDevices();

      _bluetooth.onStateChanged().listen((state) {
        switch (state) {
          case BlueThermalPrinter.CONNECTED:
            _printerResource.isConnected(true);
            break;
          case BlueThermalPrinter.DISCONNECTED:
            _printerResource.isConnected(false);
            break;
          default:
            break;
        }
      });

      _devices.clear();
      _devices.add(BluetoothDevice('Selecione um dispositivo', ''));
      _devices.addAll(devices);
      _devices.refresh();

      _printTypes.clear();
      _printTypes.add(PrintTypeModel(name: 'Normal'));
      _printTypes.add(PrintTypeModel(name: 'A930'));
      _printTypes.add(PrintTypeModel(name: 'GL-V1S'));
      _printTypes.refresh();

      if (isConnected!) {
        _printerResource.isConnected(true);
      }
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onType(PrintTypeModel? type) async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      _printType.value = type!;
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onDevice(BluetoothDevice? device) async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      _device.value = device!;
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onConnect() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      if (_device.value.name!.compareTo('Selecione um dispositivo') == 0) {
        _isLoading(false);
        Notifications.warning('ATENÇÂO', 'Nenhum dispositivo selecionado');
      } else {
        _bluetooth.isConnected.then((connect) async {
          if (!connect!) {
            await _bluetooth.connect(_device.value).catchError((error) async => _printerResource.isConnected(false));
            _printerResource.isConnected(true);
          }

          if (_printerResource.isConnected.value) {
            if (await _printerResource.hasPrinter()) {
              _printerResource.clear();
            }

            _printerResource.setDevice(_device.value);
            _printerResource.setPrintType(_printType.value);

            _printerResource.setPrinter(PrinterModel(
              name: _device.value.name,
              address: _device.value.address,
              type: _printType.value.name,
            ));
          }
        });

      _isLoading(false);
      }
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  Future<void> onDesconnect() async {
    if (_isLoading.value) {
      return;
    }

    _isLoading(true);

    try {
      _bluetooth.disconnect();
      _printerResource.isConnected(false);
      BluetoothDevice('Selecione um dispositivo', '');

      if (await _printerResource.hasPrinter()) {
        _printerResource.clear();
      }

      _device.value = BluetoothDevice('Selecione um dispositivo', '');
      _printType.value = PrintTypeModel(name: 'Normal');

      _printerResource.setDevice(BluetoothDevice('Selecione um dispositivo', ''));
      _printerResource.setPrintType(PrintTypeModel(name: 'Normal'));

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      Notifications.danger('ERRO', Utils.exception(e));
    }
  }

  get isLoading => _isLoading;
  get isConneced => _printerResource.isConnected;
  get printType => _printType;
  get printTypes => _printTypes;
  get device => _device;
  get devices => _devices;
}
