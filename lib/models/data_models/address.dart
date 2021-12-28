class Address {
  int id;
  String number;
  String street;
  String subdistrict;
  String district;
  String city;

  Address(
      {required this.id,
      required this.number,
      required this.street,
      required this.subdistrict,
      required this.district,
      required this.city});

  String getAddress() {
    return "$number, $street, $subdistrict, $district, $city";
  }

  factory Address.initEmpty() {
    return Address(
        id: -1,
        number: "",
        street: "",
        subdistrict: "",
        district: "",
        city: "");
  }

  factory Address.fromJSON(Map<String, dynamic> parsedJson) {
    return Address(
        id: parsedJson['Id'],
        number: parsedJson['SoNhaTo'] ?? '',
        street: parsedJson['Duong'] ?? '',
        subdistrict: parsedJson['XaPhuong'] ?? '',
        district: parsedJson['QuanHuyen'] ?? '',
        city: parsedJson['TinhTP'] ?? '');
  }
}
