class PrintTypeModel {
  final String? name;

  PrintTypeModel({
    this.name,
  });

  factory PrintTypeModel.fromJson(Map<String, dynamic> json) => PrintTypeModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  bool operator ==(covariant PrintTypeModel other) {
    if (other.name == null || name == null) {
      return false;
    }

    // ignore: unnecessary_type_check
    return other is PrintTypeModel && other.name!.compareTo(name!) == 0;
  }

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
