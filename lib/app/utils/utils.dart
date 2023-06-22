import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static String toLine(String left, String right, int size) {
    return left.toUpperCase().padRight(size-(left.length+right.length),' ') + right.toUpperCase();
  }

  static String toDate(String date) {
    List out = date.split('-');
    return  '${out[2]}/${out[1]}/${out[0]}';
  }

  static String toDateTimeRange(DateTime startedAt, DateTime endedAt) {
    String out = startedAt.day.toString().padLeft(2, '0');
    out += '/';
    out += startedAt.month.toString().padLeft(2, '0');
    out += '/';
    out += startedAt.year.toString();
    out += ' até ';
    out += endedAt.day.toString().padLeft(2, '0');
    out += '/';
    out += endedAt.month.toString().padLeft(2, '0');
    out += '/';
    out += endedAt.year.toString();
    return  out;
  }

  static String toDateTime(DateTime? input, {String link = ' '}) {
    if (input == null) {
      return '';
    }
    String date = DateFormat('dd/MM/yyyy').format(input);
    String time = DateFormat('HH:mm:ss').format(input);
    return '$date$link$time';
  }

  static String notSpecials(String input) {
    return input.toUpperCase().replaceAll(RegExp('[^A-Za-z0-9]'), '').replaceAll("Ç", 'C').replaceAll("'", '').replaceAll('"', '');
  }

  static String toApiDateTime(DateTime? input, {String link = ' '}) {
    if (input == null) {
      return '';
    }
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(input);
  }

  static String toApiDateTimeRange(DateTime? input, String time) {
    if (input == null) {
      return '';
    }
    return DateFormat('yyyy-MM-dd $time').format(input);
  }

  static double monetaryToDouble(String? input) {
    if (input == null) {
      return 0.0;
    }
    return double.parse(input.replaceAll('R', '').replaceAll('\$', '').replaceAll(' ', '').replaceAll('.', '').replaceAll(',', '.'));
  }

  static String toMonetary(double? input) {
    if (input == null) {
      return '';
    }
    double value = double.parse((input * 100).toString());
    return 'R\$ ${NumberFormat("#,##0.00", "pt_BR").format(value / 100)}';
  }

  static Future<T?>? back<T>({T? result, bool closeOverlays = true, bool canPop = true, int? id}) {
    Get.back(result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);
    return null;
  }

  static Future<T?>? go<T>(String page, {dynamic arguments, int? id, bool preventDuplicates = true, Map<String, String>? parameters}) {
    if (Get.isSnackbarOpen || Get.isOverlaysOpen || Get.isBottomSheetOpen! || Get.isDialogOpen!) {
      Get.back(closeOverlays: true, canPop: true);
    }
    Get.toNamed(page, arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
    return null;
  }

  static Future<T?>? goCleaning<T>(
    String newRouteName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    if (Get.isSnackbarOpen || Get.isOverlaysOpen || Get.isBottomSheetOpen! || Get.isDialogOpen!) {
      Get.back(closeOverlays: true, canPop: true);
    }
    Get.offAllNamed(newRouteName, predicate: (Route<dynamic> route) => false, arguments: arguments, id: id, parameters: parameters);
    return null;
  }

  static int sort(dynamic a, dynamic b, bool asc) {
    if (a.runtimeType != b.runtimeType) {
      assert(a.runtimeType == b.runtimeType);
    }

    if (a.runtimeType == String) {
      if (asc) {
        return a.toLowerCase().compareTo(b.toLowerCase()) == 0 ? 0 : 1;
      }

      return b.toLowerCase().compareTo(a.toLowerCase()) == 0 ? 0 : 1;
    } else if (a.runtimeType == int) {
      if (asc) {
        return a == b ? 0 : 1;
      }

      return b == a ? 0 : 1;
    } else if (a.runtimeType == bool) {
      if (asc) {
        return (a ? 1 : 0) == (b ? 1 : 0) ? 0 : 1;
      }

      return (b ? 1 : 0) == (a ? 1 : 0) ? 0 : 1;
    } else if (a.runtimeType == double) {
      if (asc) {
        return a == b ? 0 : 1;
      }

      return b == a ? 0 : 1;
    } else if (a.runtimeType == DateTime) {
      int intA = int.parse(a.toString().replaceAll('/', '').replaceAll('-', '').replaceAll(':', '').replaceAll(' ', ''));
      int intB = int.parse(b.toString().replaceAll('/', '').replaceAll('-', '').replaceAll(':', '').replaceAll(' ', ''));
      if (asc) {
        return intA.compareTo(intB) == 0 ? 0 : 1;
      }

      return intB.compareTo(intA) == 0 ? 0 : 1;
    }

    return 1;
  }

  static T wrap<T extends num>(T arg, T min, T max) {
    return arg > max
        ? min
        : arg < min
            ? max
            : arg;
  }

  static T clamp<T extends num>(T arg, T min, T max) {
    return arg > max
        ? max
        : arg < min
            ? min
            : arg;
  }

  static String exception(dynamic e) {
    if (e.runtimeType == String) {
      Map erro = json.decode(e.toString());
      if (erro.containsKey('message')) {
        return erro['message'];
      }
    }

    return 'Houston, nós temos um problema!';
  }

  static String onThrow(dynamic err) {
    return '{"message": "${err.toString()}"}';
  }
}
