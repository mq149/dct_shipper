import 'package:dct_shipper/models/data_models/product.dart';
import 'package:dct_shipper/views/view_elements/order_product_item_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderProductListWidget extends StatelessWidget {
  List<Product> products;

  OrderProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == products.length - 1) {
            return OrderProductItemWidget(
              product: products[index],
              bottomPadding: 60,
            );
          }
          return OrderProductItemWidget(product: products[index]);
        }); //ListView.builder(itemBuilder: itemBuilder)
  }
}
