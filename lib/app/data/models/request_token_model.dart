import 'package:dozenpos/app/utils/utils.dart';

class RequestTokenModel {
  final bool? success;
  final String? baseUrl;
  final DateTime? expiresAt;
  final String? requestToken;

  RequestTokenModel({
    this.success,
    this.baseUrl,
    this.expiresAt,
    this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) => RequestTokenModel(
        success: json["success"],
        baseUrl: json["base_url"],
        expiresAt: DateTime.parse(json["expires_at"]),
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "base_url": baseUrl,
        "expires_at": Utils.toApiDateTime(expiresAt),
        "request_token": requestToken,
      };
}
