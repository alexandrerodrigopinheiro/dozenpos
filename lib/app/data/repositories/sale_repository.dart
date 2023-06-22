import 'package:dozenpos/app/data/models/contest_model.dart';
import 'package:dozenpos/app/data/models/ticket_model.dart';
import 'package:dozenpos/app/data/providers/sale_provider.dart';
import 'package:get/get.dart';

class SaleRepository {
  final _saleProvider = Get.find<SaleProvider>();

  Future<ContestModel?> get() async => await _saleProvider.get();

  Future<TicketModel?> purchase(int id, String numbers, String name, String phone) async => await _saleProvider.purchase(id, numbers, name, phone);
}
