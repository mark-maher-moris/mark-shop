import 'package:flutter/material.dart';
import 'package:mark_shop/Pages/Admin/addProduct.dart';

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
                  child: Text('add product')),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddProduct()));
                },
                child: Text('orders'),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
                  child: Text('add product'))
            ]),
      ),
    ));
  }
}
