import 'package:dozenpos/app/utils/utils.dart';

class ConnectionModel {
  final String? baseUrl;
  final String? userAgent;
  final String? contentType;
  final String? accessToken;
  final String? apiKey;
  final String? apiVersion;
  final DateTime? updatedAt;
  final bool? status;

  ConnectionModel({
    this.baseUrl,
    this.userAgent,
    this.contentType,
    this.accessToken,
    this.apiKey,
    this.apiVersion,
    this.updatedAt,
    this.status,
  });

  factory ConnectionModel.fromJson(Map<String, dynamic> json) => ConnectionModel(
        baseUrl: json["base_url"],
        userAgent: json["user_agent"],
        contentType: json["content_type"],
        accessToken: json["access_token"],
        apiKey: json["api_key"],
        apiVersion: json["api_version"],
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "user_agent": userAgent,
        "content_type": contentType,
        "access_token": accessToken,
        "api_key": apiKey,
        "api_version": apiVersion,
        "updated_at": Utils.toApiDateTime(updatedAt),
        "status": status,
      };
}
