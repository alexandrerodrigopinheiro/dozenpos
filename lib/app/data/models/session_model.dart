class SessionModel {
  final int? id;
  final int? levelAccess;
  final String? name;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final bool? status;
  final String? accessToken;
  final bool? remember;

  SessionModel({
    this.id,
    this.levelAccess,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.status,
    this.accessToken,
    this.remember,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json['id'],
        levelAccess: json['level_access'],
        name: json['name'],
        updatedAt: DateTime.parse(json['updated_at']),
        createdAt: DateTime.parse(json['created_at']),
        status: json['status'],
        accessToken: json['access_token'],
        remember: json.containsKey('remember') ? json['remember'] : false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'level_access': levelAccess,
        'name': name,
        'updated_at': updatedAt.toString(),
        'created_at': createdAt.toString(),
        'status': status,
        'access_tToken': accessToken,
        'remember': remember,
      };
}
