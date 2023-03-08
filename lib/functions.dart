import 'Models/product.dart';

getProductByCategory(String categoryConst, List allProducts) {
  List<Product> productsList = [];
  try {
    for (var product in allProducts) {
      if (product.category == categoryConst) {
        productsList.add(product);
      }
    }
  } on Error catch (e) {
    print(e);
  }

  return productsList;
}
