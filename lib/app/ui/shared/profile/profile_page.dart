import 'package:dozenpos/app/data/controllers/profile_controller.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';
import 'package:dozenpos/app/ui/shared/widgets/button_custom.dart';
import 'package:dozenpos/app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          BackButton(
                            color: GlobalColor.primaryColor,
                            onPressed: controller.goBack,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              ConstantsResource.appName.toUpperCase(),
                              style: const TextStyle(
                                color: GlobalColor.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Altere sua senha',
                        style: TextStyle(
                          color: GlobalColor.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldCustom(
                        controller: controller.controllerPassword,
                        hintText: 'Senha atual',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldCustom(
                        controller: controller.controllerNewPassword,
                        hintText: 'Senha nova',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldCustom(
                        controller: controller.controllerConfirmationPassword,
                        hintText: 'Confirme a senha',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      ButtonCustom(
                        text: 'Salvar',
                        onPressed: controller.onSave,
                      ),
                    ],
                  ),
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
    );
  }
}
