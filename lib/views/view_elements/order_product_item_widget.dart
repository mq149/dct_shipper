import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/models/data_models/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderProductItemWidget extends StatelessWidget {
  Product product;
  double bottomPadding = 10;
  OrderProductItemWidget(
      {Key? key, required this.product, this.bottomPadding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      padding: EdgeInsets.only(bottom: bottomPadding),
      height: 80 + bottomPadding,
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: Config.getShadow2()),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200])),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    product.getUnit(),
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(product.getWeight(),
                      style: Theme.of(context).textTheme.caption)
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  product.getUnitPrice(),
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
