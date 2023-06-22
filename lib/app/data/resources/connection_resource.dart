import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:dozenpos/app/data/models/connection_model.dart';
import 'package:dozenpos/app/data/resources/constants_resource.dart';

class ConnectionResource {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  final String _key = 'connection';
  final Dio _dio = Dio();
  final Map<String, dynamic> _urlParameters = <String, dynamic>{};
  dynamic _bodyParameters;
  String _baseUrl = '';

  ConnectionResource() {
    _dio.options.contentType = ConstantsResource.contentType;
    _dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = ConstantsResource.connectTimeout;
    _dio.options.receiveTimeout = ConstantsResource.receiveTimeout;
    _dio.options.maxRedirects = ConstantsResource.maxAuthRetries;
  }

  Future<void> setConnection(ConnectionModel connectionModel) async => await _storage.write(key: _key, value: jsonEncode(connectionModel.toJson()));

  Future<ConnectionModel?> getConnection() async {
    final String? data = await _storage.read(key: _key);

    if (data == null) {
      return null;
    }

    return ConnectionModel.fromJson(jsonDecode(data));
  }

  Future<bool> hasConnection() async => await _storage.containsKey(key: _key);

  Future<bool> initialize() async {
    final ConnectionModel? connectionModel = await getConnection();
    Map<String, dynamic> headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'text/plain',
    };

    if (connectionModel != null) {
      if (connectionModel.accessToken!.isNotEmpty) {
        headers.addEntries({'Authorization': 'Bearer ${connectionModel.accessToken!}'}.entries);
      }

      if (connectionModel.userAgent!.isNotEmpty) {
        headers.addEntries({'userAgent': connectionModel.userAgent}.entries);
      }

      if (connectionModel.contentType!.isNotEmpty) {
        headers.addEntries({'Content-Type': connectionModel.contentType}.entries);
      }

      // if (connectionModel.apiKey!.isNotEmpty) {
      //   headers.addEntries({'Api-Key': connectionModel.apiKey}.entries);
      // }

      if (connectionModel.baseUrl!.isNotEmpty) {
        _baseUrl = ConstantsResource.baseUrl;
      }
    } else {
      headers.addEntries({'userAgent': ConstantsResource.userAgent}.entries);
      headers.addEntries({'Content-Type': ConstantsResource.contentType}.entries);
      // headers.addEntries({'apiKey': ConstantsResource.baseUrl}.entries);
      _baseUrl = ConstantsResource.baseUrl;
    }

    _dio.options.headers = headers;

    return true;
  }

  Future<bool> tokenize() async {
    final ConnectionModel? connectionModel = await getConnection();
    Map<String, dynamic> headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'text/plain',
      'Authorization': 'Bearer ${ConstantsResource.user!.accessToken!}'
    };

    if (connectionModel != null) {
      if (connectionModel.accessToken!.isNotEmpty) {
        headers.addEntries({'Authorization': 'Bearer ${connectionModel.accessToken!}'}.entries);
      }

      if (connectionModel.userAgent!.isNotEmpty) {
        headers.addEntries({'userAgent': connectionModel.userAgent}.entries);
      }

      if (connectionModel.contentType!.isNotEmpty) {
        headers.addEntries({'Content-Type': connectionModel.contentType}.entries);
      }

      // if (connectionModel.apiKey!.isNotEmpty) {
      //   headers.addEntries({'Api-Key': connectionModel.apiKey}.entries);
      // }

      if (connectionModel.baseUrl!.isNotEmpty) {
        _baseUrl = ConstantsResource.baseUrl;
      }
    } else {
      headers.addEntries({'userAgent': ConstantsResource.userAgent}.entries);
      headers.addEntries({'Content-Type': ConstantsResource.contentType}.entries);
      // headers.addEntries({'apiKey': ConstantsResource.baseUrl}.entries);
      _baseUrl = ConstantsResource.baseUrl;
    }

    _dio.options.headers = headers;

    return true;
  }

  void setUrlParameters(Map<String, dynamic> uriParameters) {
    _urlParameters.addAll(uriParameters);
  }

  void setBodyParameters(dynamic bodyParameters) {
    _bodyParameters = bodyParameters;
  }

  void setQueryParameters(Map<String, dynamic> queryParameters) {
    _dio.options.queryParameters = queryParameters;
  }

  Future<Response> get(String endPoint) async {
    String uri = _baseUrl + endPoint;
    _urlParameters.forEach((k, v) {
      uri += '/${v.toString()}';
    });

    _dio.options.baseUrl = uri;

    Response response = await _dio.get(uri);
    _clear();
    return response;
  }

  Future<Response> patch(String endPoint) async {
    String uri = _baseUrl + endPoint;
    _urlParameters.forEach((k, v) {
      uri += '/${v.toString()}';
    });
    _dio.options.baseUrl = uri;
    if (_bodyParameters.isEmpty) {
      Response response = await _dio.patch(uri);
      _clear();
      return response;
    }
    Response response = await _dio.patch(uri, data: _bodyParameters);
    _clear();
    return response;
  }

  Future<Response> put(String endPoint) async {
    String uri = _baseUrl + endPoint;
    _urlParameters.forEach((k, v) {
      uri += '/${v.toString()}';
    });
    _dio.options.baseUrl = uri;

    if (_bodyParameters.isEmpty) {
      Response response = await _dio.put(uri);
      _clear();
      return response;
    }
    Response response = await _dio.put(uri, data: _bodyParameters);
    _clear();
    return response;
  }

  Future<Response> post(String endPoint) async {
    String uri = _baseUrl + endPoint;
    _urlParameters.forEach((k, v) {
      uri += '/${v.toString()}';
    });
    _dio.options.baseUrl = uri;
    if (_bodyParameters.isEmpty) {
      Response response = await _dio.post(uri);
      _clear();
      return response;
    }
    Response response = await _dio.post(uri, data: _bodyParameters);
    _clear();
    return response;
  }

  Future<Response> delete(String endPoint) async {
    String uri = _baseUrl + endPoint;
    _urlParameters.forEach((k, v) {
      uri += '/${v.toString()}';
    });
    _dio.options.baseUrl = uri;
    if (_bodyParameters.isEmpty) {
      Response response = await _dio.patch(uri);
      _clear();
      return response;
    }
    Response response = await _dio.patch(uri, data: _bodyParameters);
    _clear();
    return response;
  }

  Future<void> clear() async => await _storage.delete(key: _key);

  void _clear() {
    _urlParameters.clear();
    _dio.options.queryParameters.clear();
    _dio.options.baseUrl = '';
    _dio.options.headers = null;
  }
}
