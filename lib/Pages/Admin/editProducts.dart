import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/product.dart';
import '../../Consts/consts.dart';
import '../../provider/toEdit.dart';
import '../../serveses/store.dart';
import 'manegeProduct.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                color: Colors.green,
              );
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
                    category: data[fProductCategory] ?? '',
                    productId: doc.id));
              }

              return Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.4),
                  itemCount: productsList?.length ?? 0,
                  itemBuilder: (context, index) => GestureDetector(
                    onTapUp: (details) {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.height - dx;
                      double dy2 = MediaQuery.of(context).size.height - dy;
                      showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            PopupMenuItem(
                              child: Text('Edit'),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ManegeProduct()));
                              },
                            ),
                            PopupMenuItem(
                              child: Text('Delete'),
                              onTap: () {
                                print('Delete////////////////////');
                                _store.deleteProduct(
                                    productsList[index].productId);
                              },
                            ),
                          ]);
                    },
                    child: Column(
                      children: [
                        Image.network(productsList[index].img),
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
                              Provider.of<ToEdit>(context, listen: false)
                                  .takeProduct(productsList[index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ManegeProduct()));
                            },
                            child: Text('Edit'))
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    ));
  }
}
