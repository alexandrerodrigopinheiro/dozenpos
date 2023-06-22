import 'package:dozenpos/app/data/models/login_model.dart';
import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:get/get.dart';


class LoginProvider {
  final ConnectionResource _connectionResource = Get.find<ConnectionResource>();

  Future<LoginModel?> login(String username, String password) async {
    if (!await _connectionResource.initialize()) {
      throw Utils.onThrow('Conexão não estabelecida');
    }

    const String endPoint = "/login";
    final Map<String, dynamic> bodyParameters = {
      'username': username,
      'password': password,
    };

    _connectionResource.setBodyParameters(bodyParameters);

    final response = await _connectionResource.post(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return LoginModel.fromJson(response.data);
  }
}
