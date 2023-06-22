import 'dart:convert';

import 'package:dozenpos/app/data/models/printer_model.dart';
import 'package:dozenpos/app/data/models/print_type_model.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class PrinterResource {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
  final String _key = 'printer';
  final RxBool isConnected = false.obs;
  PrintTypeModel _printType = PrintTypeModel(name: 'Normal');
  BluetoothDevice _device = BluetoothDevice('Selecione um dispositivo', '');
  final Map<String, String> _images = {};

  Future<void> reload() async {
    if (await hasPrinter()) {
      final PrinterModel? printerModel = await getPrinter();
      _device = BluetoothDevice(printerModel!.name, printerModel.address);
      _printType = PrintTypeModel(name: printerModel.type);

      _bluetooth.isConnected.then((connected) async {
        if (!connected!) {
          await _bluetooth.connect(_device).catchError((error) async => isConnected(false));
          isConnected(true);
        }
      });
    } else {
      _printType = PrintTypeModel(name: 'Normal');
    }
  }

  Future<void> setPrinter(PrinterModel printerModel) async => await _storage.write(
        key: _key,
        value: jsonEncode(printerModel.toJson()),
      );

  Future<PrinterModel?> getPrinter() async {
    if (!await _storage.containsKey(key: _key)) {
      return null;
    }

    final String? data = await _storage.read(key: _key);

    if (data == null) {
      return null;
    }

    return PrinterModel.fromJson(jsonDecode(data));
  }

  Future<bool> hasPrinter() async => await _storage.containsKey(key: _key);

  Future<void> clear() async => await _storage.delete(key: _key);

  get printType => _printType;

  get device => _device;

  void setPrintType(PrintTypeModel printType) => _printType = printType;

  void setDevice(BluetoothDevice device) => _device = device;

  String? getImage(String key) {
    if (!_images.containsKey(key)) {
      return null;
    }
    return _images[key];
  }

  void setImage(String key, String imagePath) => _images.addEntries({key: imagePath}.entries);

  bool hasImage() => _images.isNotEmpty;

  bool containsKey(String key) => _images.containsKey(key);
}
