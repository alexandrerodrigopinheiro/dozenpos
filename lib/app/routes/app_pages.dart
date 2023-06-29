import 'package:dozenpos/app/data/bindings/financial_binding.dart';
import 'package:dozenpos/app/data/bindings/login_binding.dart';
import 'package:dozenpos/app/data/bindings/option_binding.dart';
import 'package:dozenpos/app/data/bindings/profile_binding.dart';
import 'package:dozenpos/app/data/bindings/sale_binding.dart';
import 'package:dozenpos/app/routes/routes.dart';
import 'package:dozenpos/app/ui/shared/financial/financial_page.dart';
import 'package:dozenpos/app/ui/shared/login/login_page.dart';
import 'package:dozenpos/app/ui/shared/option/option_page.dart';
import 'package:dozenpos/app/ui/shared/profile/profile_page.dart';
import 'package:dozenpos/app/ui/shared/sale/sale_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [

    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.option,
      page: () => const OptionPage(),
      binding: OptionBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.sale,
      page: () => const SalePage(),
      binding: SaleBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.financial,
      page: () => const FinancialPage(),
      binding: FinancialBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
