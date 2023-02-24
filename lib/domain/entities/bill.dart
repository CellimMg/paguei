class Bill{
  final String id;
  final String description;
  final double value;
  final DateTime dueDate;
  final RepeatFrequency repeatFrequency;

  Bill({
    required this.id,
    required this.description,
    required this.value,
    required this.dueDate,
    required this.repeatFrequency,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'],
      description: json['description'],
      value: json['value'],
      dueDate: DateTime.parse(json['dueDate']),
      repeatFrequency: json['repeatFrequency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'value': value,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'repeatFrequency': repeatFrequency.name,
    };
  }
}

enum RepeatFrequency{
  weekly,
  monthly
}