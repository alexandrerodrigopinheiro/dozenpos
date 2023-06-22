import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends GetxController {
  static void danger(String title, String message) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: GlobalColor.colorDanger,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0.0, 1.0),
          blurRadius: 1.0,
        ),
      ],
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(12),
      borderRadius: 2,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  static void success(String title, String message) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: GlobalColor.colorSuccess,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0.0, 1.0),
          blurRadius: 1.0,
        ),
      ],
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(12),
      borderRadius: 2,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  static void info(String title, String message) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: GlobalColor.colorInfo,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0.0, 1.0),
          blurRadius: 1.0,
        ),
      ],
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(12),
      borderRadius: 2,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  static void warning(String title, String message) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: GlobalColor.colorWarning,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0.0, 1.0),
          blurRadius: 1.0,
        ),
      ],
      isDismissible: true,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(12),
      borderRadius: 2,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }
}
