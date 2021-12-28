import 'address.dart';
import 'role.dart';

class User {
  int id;
  Role role;
  String phoneNumber;
  String email;
  String fullname;
  Address address;
  User(this.id, this.role, this.phoneNumber, this.email, this.fullname,
      this.address);

  factory User.initEmpty() {
    return User(0, Role.initEmpty(), '', '', '', Address.initEmpty());
  }

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
    return User(
        parsedJson['Id'] ?? 0,
        Role.initEmpty(),
        parsedJson['SDT'] ?? '',
        parsedJson['Email'] ?? '',
        parsedJson['HoTen'] ?? '',
        parsedJson['DiaChi'] != null
            ? Address.fromJSON(parsedJson['DiaChi'])
            : Address.initEmpty());
  }
}
