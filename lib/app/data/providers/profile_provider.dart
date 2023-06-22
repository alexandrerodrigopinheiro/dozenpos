import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:get/get.dart' hide Response;


class ProfileProvider {
  final ConnectionResource _connectionResource = Get.find<ConnectionResource>();

  Future<bool?> profile(int id, String password, String newPassword) async {
    if (!await _connectionResource.tokenize()) {
      throw Utils.onThrow('Conexão não estabelecida');
    }

    const String endPoint = "/profiles";
    final Map<String, dynamic> bodyParameters = {
      'id': id,
      'password': password,
      'new_password': newPassword,
    };

    _connectionResource.setBodyParameters(bodyParameters);

    final response = await _connectionResource.patch(endPoint);
    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return true;
  }
}
