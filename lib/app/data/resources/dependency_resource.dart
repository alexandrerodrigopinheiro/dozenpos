import 'package:dozenpos/app/data/providers/financial_provider.dart';
import 'package:dozenpos/app/data/providers/login_provider.dart';
import 'package:dozenpos/app/data/providers/option_provider.dart';
import 'package:dozenpos/app/data/providers/profile_provider.dart';
import 'package:dozenpos/app/data/providers/report_provider.dart';
import 'package:dozenpos/app/data/providers/result_provider.dart';
import 'package:dozenpos/app/data/providers/sale_provider.dart';
import 'package:dozenpos/app/data/providers/printer_provider.dart';
import 'package:dozenpos/app/data/repositories/financial_repository.dart';
import 'package:dozenpos/app/data/repositories/login_repository.dart';
import 'package:dozenpos/app/data/repositories/option_repository.dart';
import 'package:dozenpos/app/data/repositories/profile_repository.dart';
import 'package:dozenpos/app/data/repositories/report_repository.dart';
import 'package:dozenpos/app/data/repositories/result_repository.dart';
import 'package:dozenpos/app/data/repositories/sale_repository.dart';
import 'package:dozenpos/app/data/repositories/printer_repository.dart';
import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/data/resources/printer_resource.dart';
import 'package:dozenpos/app/data/resources/session_resource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyResource {
  static Future<void> onInit() async {
    // Other
    Get.put(const FlutterSecureStorage());
    Get.put(ConnectionResource());
    Get.put(SessionResource());
    Get.put(PrinterResource());

    Get.put(LoginProvider());
    Get.put(OptionProvider());
    Get.put(SaleProvider());
    Get.put(ResultProvider());
    Get.put(ReportProvider());
    Get.put(FinancialProvider());
    Get.put(ProfileProvider());
    Get.put(PrinterProvider());

    Get.put(LoginRepository());
    Get.put(OptionRepository());
    Get.put(SaleRepository());
    Get.put(ResultRepository());
    Get.put(ReportRepository());
    Get.put(FinancialRepository());
    Get.put(ProfileRepository());
    Get.put(PrinterRepository());
  }
}
