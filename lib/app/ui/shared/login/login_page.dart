import 'package:dozenpos/app/data/controllers/login_controller.dart';
import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'rapidinha',
                          style: TextStyle(
                            color: GlobalColor.primaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const Text(
                        'Entre com seu usuário e senha',
                        style: TextStyle(
                          color: GlobalColor.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldCustom(
                        controller: controller.controllerUsername,
                        hintText: 'Usuário',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldCustom(
                        controller: controller.controllerPassword,
                        hintText: 'Senha',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      ButtonCustom(
                        text: 'Entrar',
                        onPressed: controller.onLogin,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                visible: controller.isLoading.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.3),
                  child: const SizedBox(
                    width: 55,
                    height: 55,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: GlobalColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
