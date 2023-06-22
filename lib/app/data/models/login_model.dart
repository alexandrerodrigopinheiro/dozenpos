class LoginModel {
  final int? id;
  final String? accessToken;

  LoginModel({
    this.id,
    this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json['id'],
    accessToken: json['access_token'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'access_token': accessToken,
  };
}
