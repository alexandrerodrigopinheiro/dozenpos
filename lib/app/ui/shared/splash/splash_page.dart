import 'dart:async';

import 'package:dozenpos/app/data/controllers/splash_controller.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          ConstantsResource.appName.toUpperCase(),
          style: const TextStyle(
            color: GlobalColor.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}