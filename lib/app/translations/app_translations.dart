import 'package:get/get.dart';
import 'package:dozenpos/app/translations/en_US/en_us_translation.dart';
import 'package:dozenpos/app/translations/es_ES/es_es_translation.dart';
import 'package:dozenpos/app/translations/pt_BR/pt_br_translation.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': ptBR,
        'en_US': enUs,
        'es_mx': esES,
      };
}
