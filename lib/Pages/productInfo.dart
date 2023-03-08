import 'package:flutter/material.dart';
import 'package:mark_shop/Models/product.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({required this.product});
  late Product product;
  static String productID = '';

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'PRISE is :' + widget.product.prise,
                style: TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (productCount >= 1) {
                            productCount--;
                          }
                        });
                        print(productCount);
                      },
                      child: Icon(Icons.exposure_minus_1_outlined)),
                  SizedBox(
                    width: 7,
                  ),
                  Text(productCount.toString()),
                  SizedBox(
                    width: 7,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          productCount++;
                        });
                        print(productCount);
                      },
                      child: Icon(Icons.plus_one_outlined))
                ],
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'add to cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
