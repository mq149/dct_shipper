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
}
