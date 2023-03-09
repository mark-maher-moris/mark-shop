import 'package:flutter/material.dart';
import 'package:mark_shop/Consts/consts.dart';
import 'package:mark_shop/Models/product.dart';
import 'package:mark_shop/Pages/home.dart';
import 'package:mark_shop/Pages/productInfo.dart';
import 'package:mark_shop/provider/cartProvider.dart';
import 'package:mark_shop/serveses/store.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Cart>(context).cartProducts;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
          child: products.isEmpty
              ? Text('اضف المنتجات الى السله')
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(products[index].name),
                                Text('السعر' + products[index].prise),
                                Text('الكود' + products[index].productId),
                                Text('الكمية' +
                                    products[index].quantity.toString()),
                                GestureDetector(
                                  child: Icon(
                                    Icons.three_k_plus_outlined,
                                    size: 40,
                                  ),
                                  onTapUp: (dtil) {
                                    var dx1 = dtil.globalPosition.dx;
                                    var dy1 = dtil.globalPosition.dy;
                                    var dx2 =
                                        MediaQuery.of(context).size.width - dx1;

                                    var dy2 =
                                        MediaQuery.of(context).size.width - dy1;
                                    showMenu(
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                            dx1, dy1, dx2, dy2),
                                        items: [
                                          PopupMenuItem(
                                            child: Text('Edit'),
                                            onTap: () {
                                              print('TAPED =-------object');
                                              Navigator.pop(context);
                                              Future((() => Navigator.of(
                                                      context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductInfo(
                                                              product: products[
                                                                  index])))));
                                            },
                                          ),
                                          PopupMenuItem(
                                            child: Text('Delete'),
                                            onTap: () {
                                              Provider.of<Cart>(context,
                                                      listen: false)
                                                  .deleteProdut(
                                                      products[index]);
                                            },
                                          )
                                        ]);
                                  },
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                )
                              ],
                            );
                          }),
                    ),
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () async {
                              showCustemDialog(products);
                            },
                            child: Text('Cheakout'))),
                  ],
                )),
    ));
  }
//   Text('dsddsd'),

  void showCustemDialog(List<Product> products) {
    var price = getTotalPrice(products);
    var address;
    AlertDialog alertDialog = AlertDialog(
      title: Text('Total Price = $price\$'),
      content: TextField(
        onChanged: (val) {
          address = val;
        },
        decoration: InputDecoration(hintText: 'input your address'),
      ),
      actions: [
        MaterialButton(
            child: Text('Go'),
            onPressed: () async {
              try {
                Store _store = Store();
                await _store.storeOrders(
                    {kTotalPrice: price, kAddress: address}, products);

                print('Done----------------------------');
              } catch (e) {
                print(e);
              }
            })
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  getTotalPrice(List<Product> products) {
    var price = 0;
    for (var product in products) {
      price += product.quantity! * int.parse(product.prise);
    }
    return price;
  }
}
