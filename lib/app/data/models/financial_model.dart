class FinancialModel {
  final int? amount;
  final double? sale;
  final double? comission;
  final double? profit;

  FinancialModel({
    this.amount,
    this.sale,
    this.comission,
    this.profit,
  });

  factory FinancialModel.fromJson(Map<String, dynamic> json) => FinancialModel(
    amount: json['amount'],
    sale: json['sale'].toDouble(),
    comission: json['comission'].toDouble(),
    profit: json['profit'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'sale': sale,
    'comission': comission,
    'profit': profit,
  };
}
