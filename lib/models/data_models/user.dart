import 'address.dart';
import 'role.dart';

class User {
  int id;
  Role role;
  String phoneNumber;
  String email;
  String fullname;
  Address address;
  String gender;
  DateTime? birthdate;

  User(this.id, this.role, this.phoneNumber, this.email, this.fullname,
      this.address, this.gender, this.birthdate);

  factory User.initEmpty() {
    return User(-1, Role.initEmpty(), '', '', '', Address.initEmpty(), '',
        DateTime.now());
  }

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
    return User(
        parsedJson['Id'] ?? 0,
        Role.initEmpty(),
        parsedJson['SDT'] ?? '',
        parsedJson['email'] ?? '',
        parsedJson['HoTen'] ?? '',
        parsedJson['DiaChi'] != null
            ? Address.fromJSON(parsedJson['DiaChi'])
            : Address.initEmpty(),
        parsedJson['GioiTinh'] ?? '',
        parsedJson['NgaySinh'] != null
            ? DateTime.parse(parsedJson['NgaySinh'])
            : null);
  }

  factory User.fromJSON2(Map<String, dynamic> parsedJson) {
    return User(
        parsedJson['id'] ?? 0,
        Role.initEmpty(),
        parsedJson['sdt'] ?? '',
        parsedJson['email'] ?? '',
        parsedJson['hoTen'] ?? '',
        parsedJson['diaChi'] != null
            ? Address.fromJSON2(parsedJson['diaChi'])
            : Address.initEmpty(),
        parsedJson['gioiTinh'] ?? '',
        parsedJson['ngaySinh'] != null
            ? DateTime.parse(parsedJson['ngaySinh'])
            : null);
  }

  String getBirthDate() {
    return birthdate.toString().substring(0, 10);
  }
}
