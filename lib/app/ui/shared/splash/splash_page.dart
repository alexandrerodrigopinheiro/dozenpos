import 'dart:async';

import 'package:dozenpos/app/data/controllers/splash_controller.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Utils.goCleaning(Routes.login));
    return const Scaffold(
      backgroundColor: GlobalColor.primaryColor,
      body: Center(
        child: Text(
          'rapidinha',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}