import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mark_shop/Consts/consts.dart';

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

  Stream<QuerySnapshot> loadProducts() {
    return _firestoreInst.collection(fProductCollection).snapshots();
  }

  deleteProduct(docID) {
    _firestoreInst.collection(fProductCollection).doc(docID).delete();
  }

  editProduct(docID, data) {
    _firestoreInst.collection(fProductCollection).doc(docID).update(data);
  }
}
























  // Future<List<Product>> getProduct() async {

    // for (var doc in snapshot.documentes) {
    //   var data = doc.data;
    //   productsList.add(Product(
    //       name: data[fProductName] ?? '',
    //       description: data[fProductDiscreption] ?? '',
    //       img: data[fProductImage],
    //       location: data[fProductLocation] ?? '',
    //       prise: data[fProductPrise],
    //       category: data[fProductCategory] ?? ''));
    // }


    // List<Product> productsList = [];

    // var snapshot2 = await _firestoreInst
    //     .collection(fProductCollection)
    //     .get()
    //     .then((value) => value.docs.forEach((DocumentSnapshot doc) {
    //           productsList.add(Product(
    //               name: doc[fProductName] ?? '',
    //               description: doc[fProductDiscreption] ?? '',
    //               img: doc[fProductImage],
    //               location: doc[fProductLocation] ?? '',
    //               prise: doc[fProductPrise],
    //               category: doc[fProductCategory] ?? ''));
    //         }));

    // return productsList;
 // }
