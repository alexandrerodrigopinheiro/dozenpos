import 'package:dozenpos/app/data/models/contest_model.dart';
import 'package:dozenpos/app/data/models/ticket_model.dart';
import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:get/get.dart';


class SaleProvider {
  final ConnectionResource _connectionResource = Get.find<ConnectionResource>();

  Future<ContestModel?> get() async {
    if (!await _connectionResource.tokenize()) {
      throw Utils.onThrow('Conexão não estabelecida');
    }

    const String endPoint = "/contests";

    final response = await _connectionResource.get(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return ContestModel.fromJson(response.data);
  }
  Future<TicketModel?> purchase(int id, String numbers, String name, String phone) async {
    if (!await _connectionResource.tokenize()) {
      throw Utils.onThrow('Conexão não estabelecida');
    }

    const String endPoint = "/sales";
    final Map<String, dynamic> bodyParameters = {
      'user_id': id,
      'numbers': numbers.substring(1, numbers.length - 1).replaceAll(' ', ','),
      'name': name,
      'phone': phone,
    };

    _connectionResource.setBodyParameters(bodyParameters);

    final response = await _connectionResource.post(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 201) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return TicketModel.fromJson(response.data);
  }
}
