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
}
