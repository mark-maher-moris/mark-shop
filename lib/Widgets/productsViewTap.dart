import 'package:flutter/material.dart';

import '../Models/product.dart';
import '../Pages/productInfo.dart';
import '../functions.dart';

class ProductsView extends StatelessWidget {
  ProductsView(this.category);
  String category = '';
  List<Product> productList2 = [
    Product(
        name: '1name',
        description: '2description',
        img: '3img',
        location: '4location',
        prise: '5prise',
        category: '6category',
        productId: '7productId')
  ];

  @override
  Widget build(BuildContext context) {
    productList2 = getProductByCategory(category, productList2);
    return GridView.builder(
      itemCount: productList2?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.4),
      itemBuilder: (context, index) => Column(
        children: [
          // Image.network(productsList[index].img),
          Text(
            productList2[index].name ?? 'null',
          ),
          Text(
            productList2[index].prise ?? 'null',
          ),
          Text(
            productList2[index]?.description ?? 'null',
          ),
          Text(
            productList2[index]?.category ?? 'null',
          ),
          OutlinedButton(
              onPressed: () {
                print('m             mmmmmmmmm');
              },
              child: Text('Buy Now'))
        ],
      ),
    );
  }
}

Widget productsView(category) {
  List<Product> productList2 = [
    Product(
        name: '1name',
        description: '2description',
        img: '3img',
        location: '4location',
        prise: '5prise',
        category: '6category',
        productId: '7productId')
  ];

  productList2 = getProductByCategory(category, productList2);
  return GridView.builder(
    itemCount: productList2?.length ?? 0,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.4),
    itemBuilder: (context, index) => Column(
      children: [
        // Image.network(productsList[index].img),
        Text(
          productList2[index].name ?? 'null',
        ),
        Text(
          productList2[index].prise ?? 'null',
        ),
        Text(
          productList2[index]?.description ?? 'null',
        ),
        Text(
          productList2[index]?.category ?? 'null',
        ),
        OutlinedButton(
            onPressed: () {
              print(Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductInfo(
                        product: productList2[index],
                      ))));
            },
            child: Text('Buy Now'))
      ],
    ),
  );
}
