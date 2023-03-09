import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';

class Cart with ChangeNotifier {
  List<Product> cartProducts = [];

  addProduct(gProduct) {
    cartProducts.add(gProduct);
    notifyListeners();
  }

  deleteProdut(gProduct) {
    cartProducts.remove(gProduct);
    notifyListeners();
  }
}
