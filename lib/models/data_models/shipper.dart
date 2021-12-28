import 'role.dart';
import 'user.dart';

import 'address.dart';

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
      this.shipperId,
      this.socialId,
      this.active,
      this.plateNumber,
      this.vehicleName)
      : super(id, role, phoneNumber, email, fullname, address);

  factory Shipper.initEmpty() {
    return Shipper(-1, Role.initEmpty(), "", "", "", Address.initEmpty(), -1,
        "", false, "", "");
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
        parsedJson['Id'] ?? '',
        parsedJson['CMND'] ?? '',
        parsedJson['KichHoat'] ?? false,
        parsedJson['BienSo'] ?? '',
        parsedJson['DongXe'] ?? '');
  }
}
