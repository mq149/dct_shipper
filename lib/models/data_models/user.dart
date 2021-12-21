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
}
