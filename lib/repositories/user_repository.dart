import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/address.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:dct_shipper/models/data_models/user.dart';

User currentUser = User.initEmpty();
Shipper currentShipper = Shipper.initEmpty();

Future<void> login() async {
  Address address = Address(
      id: 1,
      number: '156/0',
      street: 'Võ Văn Ngân',
      subdistrict: 'Bình Thọ',
      district: 'Thủ Đức',
      city: 'TP. HCM');
  currentUser = User(1, Helper.getShipperRole(), '0772770170',
      'buiminhquan@email.com', 'Bùi Minh Quân', address);
  currentShipper = Shipper(
      currentUser.id,
      currentUser.role,
      currentUser.phoneNumber,
      currentUser.email,
      currentUser.fullname,
      currentUser.address,
      1,
      '217498127',
      true,
      '12-N5 12755',
      'Honda Wave');
}
