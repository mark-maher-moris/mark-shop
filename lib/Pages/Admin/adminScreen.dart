import 'package:flutter/material.dart';
import 'package:mark_shop/Pages/Admin/addProduct.dart';

import 'editProducts.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
                  child: Text('Add Product')),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProduct()));
                },
                child: Text('Edit Products'),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProduct()));
                  },
                  child: Text('Orders'))
            ]),
      ),
    ));
  }
}
