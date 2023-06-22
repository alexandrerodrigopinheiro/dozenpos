import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:dozenpos/app/data/models/connection_model.dart';
import 'package:dozenpos/app/data/models/session_model.dart';
import 'package:dozenpos/app/data/resources/connection_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';

class SessionResource {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  final ConnectionResource _connectionResource = Get.find<ConnectionResource>();
  final String _key = 'session';

  Future<SessionModel?> getUpdateSession() async {
    if (!await _connectionResource.initialize()) {
      return null;
    }

    final SessionModel? sessionModel = await getSession();
    const String endPoint = '/point';
    final Map<String, dynamic> queryParameters = {
      'id': sessionModel!.id,
    };

    _connectionResource.setQueryParameters(queryParameters);

    final Response response = await _connectionResource.get(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return SessionModel.fromJson(response.data);
  }

  Future<SessionModel?> newSession(String telephone, String password) async {
    if (!await _connectionResource.hasConnection()) {
      return null;
    }

    final ConnectionModel? connectionModel = await _connectionResource.getConnection();

    // const String? machineId = 'sssssssssssss';
    const String endPoint = '/auth/systems';
    final Map<String, dynamic> queryParameters = {
      'telephone': telephone,
      'password': password,
      // 'machine_id': machineId,
      'api_key': connectionModel!.apiKey,
      'app_version': connectionModel.apiVersion,
    };

    _connectionResource.setQueryParameters(queryParameters);

    final Response response = await _connectionResource.get(endPoint);

    if (response.data == null) {
      throw Utils.onThrow('Sem conteúdo');
    }

    if (response.statusCode != 200) {
      throw Utils.onThrow(response.statusCode.toString());
    }

    return SessionModel.fromJson(response.data);
  }

  Future<void> setSession(SessionModel sessionModel) async => await _storage.write(key: _key, value: jsonEncode(sessionModel.toJson()));

  Future<SessionModel?> getSession() async {
    if (!await _storage.containsKey(key: _key)) {
      return null;
    }

    final String? data = await _storage.read(key: _key);

    if (data == null) {
      return null;
    }

    // final SessionModel? sessionModel = SessionModel.fromJson(jsonDecode(data));

    // if (DateTime.now().isAfter(sessionModel!.expiresAt!)) {
    //   await _storage.delete(key: _key);

    //   return null;
    // }

    // return sessionModel;
    return null;
  }

  Future<bool> hasSession() async => await _storage.containsKey(key: _key);

  Future<void> clear() async => await _storage.delete(key: _key);
}
