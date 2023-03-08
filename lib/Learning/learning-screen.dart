import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Consts/consts.dart';
import '../Models/product.dart';
import '../serveses/auth.dart';
import '../serveses/store.dart';

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  Store _store = Store();

  List<Product> _allProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.amber,
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> productsList = [];
                for (var doc in snapshot.data!.docs) {
                  productsList.add(Product(
                      name: doc[fProductName] ?? '',
                      description: doc[fProductDiscreption],
                      img: fProductImage,
                      location: fProductLocation,
                      prise: fProductPrise,
                      category: fProductCategory,
                      productId: 'dd'));
                }
                _allProducts = productsList;
                //productsList.clear;
                //getProductByCategory(kBoards);

                return Center(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.4),
                    itemCount: productsList?.length ?? 0,
                    itemBuilder: (context, index) => GestureDetector(
                      child: Column(
                        children: [
                          //Image.network(productsList[index].img),
                          Text(
                            productsList[index].name ?? 'null',
                          ),
                          Text(
                            productsList[index].prise ?? 'null',
                          ),
                          Text(
                            productsList[index].description ?? 'null',
                          ),
                          Text(
                            productsList[index].category ?? 'null',
                          ),
                          OutlinedButton(
                              onPressed: () {
                                print(
                                  productsList[index].category ?? 'null',
                                );
                              },
                              child: Text('Buy Now'))
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  getProductByCategory(String categoryConst) {
    List<Product> productsList = [];
    for (var product in _allProducts) {
      if (product.category == kBoards) {
        productsList.add(product);
      }
    }
    return productsList;
  }
}
