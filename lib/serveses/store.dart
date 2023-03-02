import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mark_shop/Style/consts.dart';

import '../Models/product.dart';

class Store {
  final FirebaseFirestore _firestoreInst = FirebaseFirestore.instance;

  addProduct(Product product) {
    _firestoreInst.collection(fProductCollection).add({
      fProductName: product.name,
      fProductPrise: product.prise,
      fProductImage: product.img,
      fProductCategory: product.category,
      fProductDiscreption: product.description,
      fProductLocation: product.location
    });
  }
}
