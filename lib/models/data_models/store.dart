import 'role.dart';
import 'user.dart';

import 'address.dart';

class Store extends User {
  int storeId;
  String name;
  bool active;

  Store(
      int id,
      Role role,
      String phoneNumber,
      String email,
      String fullname,
      Address address,
      String gender,
      DateTime? birthdate,
      this.storeId,
      this.name,
      this.active)
      : super(
            id, role, phoneNumber, email, fullname, address, gender, birthdate);

  factory Store.fromJSON(Map<String, dynamic> parsedJson) {
    User user = User.fromJSON(parsedJson['User'] as Map<String, dynamic>);
    return Store(
        user.id,
        user.role,
        user.phoneNumber,
        user.email,
        user.fullname,
        user.address,
        user.gender,
        user.birthdate,
        parsedJson['Id'] ?? '',
        parsedJson['TenCuaHang'] ?? '',
        parsedJson['TrangThaiKichHoat'] ?? false);
  }
}
