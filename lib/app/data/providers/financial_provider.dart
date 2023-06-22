import 'package:dozenpos/app/data/models/financial_model.dart';
import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class FinancialProvider {
  final ConnectionResource _connectionResource = Get.find<ConnectionResource>();

  Future<FinancialModel?> find(int id, DateTime begin, DateTime end) async {
    if (!await _connectionResource.tokenize()) {
      throw Utils.onThrow('Conexão não estabelecida');
    }

    const String endPoint = "/sales";
    final Map<String, dynamic> urlParameters = {
      'id': id,
      'begin': DateFormat('yyyy-MM-dd').format(begin),
      'end': DateFormat('yyyy-MM-dd').format(end),
    };

    _connectionResource.setUrlParameters(urlParameters);

    final response = await _connectionResource.get(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return FinancialModel.fromJson(response.data);
  }
}
