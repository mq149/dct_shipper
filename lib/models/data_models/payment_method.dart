class PaymentMethod {
  int id;
  String name;

  PaymentMethod({required this.id, required this.name});

  factory PaymentMethod.fromJSON(Map<String, dynamic> parsedJSON) {
    return PaymentMethod(id: parsedJSON['Id'], name: parsedJSON['Ten']);
  }
}
