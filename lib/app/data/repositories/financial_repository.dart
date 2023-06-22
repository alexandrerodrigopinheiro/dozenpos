import 'package:dozenpos/app/data/models/financial_model.dart';
import 'package:dozenpos/app/data/providers/financial_provider.dart';
import 'package:get/get.dart';

class FinancialRepository {
  final _financialProvider = Get.find<FinancialProvider>();

  Future<FinancialModel?> find(int id, DateTime begin, DateTime end) async => await _financialProvider.find(id, begin, end);
}
