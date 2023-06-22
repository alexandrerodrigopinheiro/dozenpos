class ContestModel {
  final int? code;
  final String? date;

  ContestModel({
    this.code,
    this.date,
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) => ContestModel(
    code: json['id'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'id': code,
    'date': date,
  };
}
