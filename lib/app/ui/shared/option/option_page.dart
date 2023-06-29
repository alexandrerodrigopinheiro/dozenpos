import 'package:dozenpos/app/data/controllers/option_controller.dart';
import 'package:dozenpos/app/ui/shared/widgets/grid_item_custom.dart';
import 'package:dozenpos/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionPage extends GetView<OptionController> {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 600,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.603,
                    children: [
                       GridItemCustom(
                        title: 'Venda',
                        icon: Icons.storefront,
                        onPressed: controller.sale,
                       ),
                       GridItemCustom(
                        title: 'Financeiro',
                        icon: Icons.trending_up,
                        onPressed: controller.financial,
                       ),
                       GridItemCustom(
                        title: 'Perfil',
                        icon: Icons.person,
                        onPressed: controller.profile,
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
