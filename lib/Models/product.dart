class Product {
  String name;
  String prise;
  String location;
  String img;
  String description;
  String category;
  String productId;
  int? quantity = 0;

  Product(
      {this.quantity,
      required this.name,
      required this.description,
      required this.img,
      required this.location,
      required this.prise,
      required this.category,
      required this.productId});
}
