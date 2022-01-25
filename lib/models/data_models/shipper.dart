import 'role.dart';
import 'user.dart';
import 'address.dart';
import 'package:intl/intl.dart';

class Shipper extends User {
  int shipperId;
  String socialId;
  bool active;
  String plateNumber;
  String vehicleName;

  Shipper(
      int id,
      Role role,
      String phoneNumber,
      String email,
      String fullname,
      Address address,
      String gender,
      DateTime? birthdate,
      this.shipperId,
      this.socialId,
      this.active,
      this.plateNumber,
      this.vehicleName)
      : super(
            id, role, phoneNumber, email, fullname, address, gender, birthdate);

  factory Shipper.initEmpty() {
    return Shipper(-1, Role.initEmpty(), "", "", "", Address.initEmpty(), '',
        null, -1, "", false, "", "");
  }

  factory Shipper.fromJSON(Map<String, dynamic> parsedJson) {
    User user = User.initEmpty();
    return Shipper(
        user.id,
        user.role,
        user.phoneNumber,
        user.email,
        user.fullname,
        user.address,
        user.gender,
        user.birthdate,
        parsedJson['Id'] ?? '',
        parsedJson['CMND'] ?? '',
        parsedJson['KichHoat'] ?? false,
        parsedJson['BienSo'] ?? '',
        parsedJson['DongXe'] ?? '');
  }

  factory Shipper.fromJSON2(Map<String, dynamic> parsedJson) {
    User user;
    if (parsedJson['user'] != null) {
      user = User.fromJSON2(parsedJson['user']);
    } else {
      user = User.initEmpty();
    }
    return Shipper(
        user.id,
        user.role,
        user.phoneNumber,
        user.email,
        user.fullname,
        user.address,
        user.gender,
        user.birthdate,
        parsedJson['id'] ?? '',
        parsedJson['cmnd'] ?? '',
        parsedJson['kichHoat'] ?? false,
        parsedJson['bienSo'] ?? '',
        parsedJson['dongXe'] ?? '');
  }
  @override
  String getBirthDate() {
    if (birthdate != null) {
      return DateFormat('dd-MM-yyyy').format(birthdate!);
    }
    return '-';
  }
}
