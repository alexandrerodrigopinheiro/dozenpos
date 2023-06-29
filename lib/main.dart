import 'package:dozenpos/app/data/bindings/splash_binding.dart';
import 'package:dozenpos/app/data/resources/dependency_resource.dart';
import 'package:dozenpos/app/translations/app_translations.dart';
import 'package:dozenpos/app/ui/shared/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyResource.onInit();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onReady: () async => await Wakelock.enable(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      initialBinding: SplashBinding(),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.pages,
      home: const SplashPage(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale("en", "US"),
        Locale("es", "CR"),
      ],
      translations: AppTranslation(),
    );
  }
}
