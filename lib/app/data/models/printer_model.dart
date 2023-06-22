class PrinterModel {
  final String? name;
  final String? address;
  final String? type;

  PrinterModel({
    this.name,
    this.address,
    this.type,
  });

  factory PrinterModel.fromJson(Map<String, dynamic> json) => PrinterModel(
        name: json['name'],
        address: json['address'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'type': type,
      };
}
