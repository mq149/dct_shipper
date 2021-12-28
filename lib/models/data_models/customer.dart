import 'address.dart';
import 'role.dart';
import 'user.dart';

class Customer extends User {
  int customerId;
  String socialId;

  Customer(int id, Role role, String phoneNumber, String email, String fullname,
      Address address, this.customerId, this.socialId)
      : super(id, role, phoneNumber, email, fullname, address);

  factory Customer.fromJSON(Map<String, dynamic> parsedJson) {
    User user = User.initEmpty();
    return Customer(
      user.id,
      user.role,
      user.phoneNumber,
      user.email,
      user.fullname,
      user.address,
      parsedJson['Id'] ?? '',
      parsedJson['CMND'] ?? '',
    );
  }
}
