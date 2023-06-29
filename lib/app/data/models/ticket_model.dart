class TicketModel {
  final String? title;
  final String? owner;
  final int? contest;
  final int? code;
  final String? date;
  final String? time;
  final double? value;
  final double? prize;
  final String? numbers;
  final String? name;
  final String? phone;
  final String? observation;

  TicketModel({
    this.title,
    this.owner,
    this.contest,
    this.code,
    this.date,
    this.time,
    this.value,
    this.prize,
    this.numbers,
    this.name,
    this.phone,
    this.observation,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    title: json['title'],
    owner: json['owner'],
    contest: json['contest_id'],
    code: json['id'],
    date: json['date'],
    time: json['time'],
    value: json['value'].toDouble(),
    prize: json['prize'].toDouble(),
    numbers: json['numbers'],
    name: json['name'],
    phone: json['phone'],
    observation: json['observation'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'owner': owner,
    'contest_id': contest,
    'id': code,
    'date': date,
    'time': time,
    'value': value,
    'prize': prize,
    'numbers': numbers,
    'name': name,
    'phone': phone,
    'observation': observation,
  };
}
