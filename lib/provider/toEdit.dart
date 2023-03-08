import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';

class ToEdit with ChangeNotifier {
  var id;
  var data;
  Product? productToEdit;

  changeDataId(idVal, dataVal) {
    id = idVal;
    data = dataVal;
    notifyListeners();
  }

  takeProduct(product) {
    productToEdit = product;
    notifyListeners();
  }
}
