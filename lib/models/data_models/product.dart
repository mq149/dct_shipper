import 'package:dct_shipper/extensions/number_separator.dart';

class Product {
  int id;
  String name;
  double unitPrice;
  double weight;
  int unit;

  Product(this.id, this.name, this.unitPrice, this.weight, this.unit);

  String getUnit() {
    return 'Unit: ' + unit.toString();
  }

  String getWeight() {
    return 'Weight: ' + weight.toStringAsFixed(2);
  }

  String getUnitPrice() {
    return unitPrice.toStringWithSeparators() + 'đ';
  }
}
