import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Models/product.dart';
import '../../Style/consts.dart';
import '../../serveses/store.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();
  List<Product> _products = [
    Product(
        name: 'name',
        description: 'description',
        img: 'img',
        location: ' location',
        prise: ' prise',
        category: 'category')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('No Data ');
            } else {
              List<Product> productsList = [];

              for (var doc in snapshot.data!.docs) {
                var data = doc;
                productsList.add(Product(
                    name: data[fProductName] ?? '',
                    description: data[fProductDiscreption] ?? '',
                    img: data[fProductImage],
                    location: data[fProductLocation] ?? '',
                    prise: data[fProductPrise],
                    category: data[fProductCategory] ?? ''));
              }

              return Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: productsList?.length ?? 0,
                  itemBuilder: (context, index) => Container(
                      height: 200,
                      width: 200,
                      color: Colors.amber,
                      child: Stack(
                        children: [
                          Image.network(productsList[index].img),
                          Opacity(
                            opacity: 6,
                            child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.black),
                          ),
                          Column(
                            children: [
                              Text(productsList[index].name ?? 'null',style: TextStyle(color: Colors.white),),
                              Text(productsList[index].prise ?? 'null',style: TextStyle(color: Colors.white),),
                              Text(productsList[index].description ?? 'null',style: TextStyle(color: Colors.white),),
                              Text(productsList[index].category ?? 'null',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ],
                      )),
                ),
              );
            }
          }),
    ));
  }
}
