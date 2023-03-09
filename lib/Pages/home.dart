import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mark_shop/Models/product.dart';
import 'package:mark_shop/Pages/cartScreen.dart';
import 'package:mark_shop/Pages/productInfo.dart';
import 'package:mark_shop/serveses/auth.dart';
import '../Consts/consts.dart';
import '../Widgets/productsViewTap.dart';
import '../functions.dart';
import '../serveses/store.dart';
import '/Pages/item_page.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Auth _authObj = Auth();
  Store _store = Store();
  User? _logedUser;

  int tapBarIndex = 0;
  int bottonBarIndex = 0;
  List<Product> _allProducts = [];
  getUser() async {
    _logedUser = await _authObj.namozag.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          DefaultTabController(
            length: 3,
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: bottonBarIndex,
                    onTap: (val) {
                      setState(() {
                        bottonBarIndex = val;
                      });
                    },
                    fixedColor: Colors.green,
                    selectedFontSize: 20,
                    items: [
                      BottomNavigationBarItem(
                        label: 'label 1',
                        icon: Icon(Icons.abc),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dangerous),
                        label: 'label 2',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.e_mobiledata),
                        label: 'label 3',
                      ),
                    ]),
                drawer: Drawer(
                  child: Column(),
                ),
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  bottom: TabBar(
                      indicatorWeight: 5,
                      onTap: (valu) {
                        setState(() {
                          tapBarIndex = valu;
                        });
                      },
                      tabs: [
                        Text(
                          'Boardes',
                          style: TextStyle(
                              color: tapBarIndex == 0
                                  ? Colors.greenAccent
                                  : Colors.white),
                        ),
                        Text(
                          'Sensors',
                          style: TextStyle(
                              color: tapBarIndex == 1
                                  ? Colors.greenAccent
                                  : Colors.white),
                        ),
                        Text(
                          'Projets',
                          style: TextStyle(
                              color: tapBarIndex == 2
                                  ? Colors.greenAccent
                                  : Colors.white),
                        ),
                      ]),
                ),
                body: TabBarView(
                  children: [
                    boardsView(),
                    productsView(kBoards),
                    ProductsView(kSensors),
                  ],
                )),
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      },
                      icon: Icon(Icons.shopping_cart_checkout_outlined))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget boardsView() {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> productsList = [];
            for (var doc in snapshot.data!.docs) {
              productsList.add(Product(
                  name: doc[fProductName] ?? '',
                  description: doc[fProductDiscreption],
                  img: doc[fProductImage],
                  location: doc[fProductLocation],
                  prise: doc[fProductPrise],
                  category: doc[fProductCategory],
                  productId: 'dd'));
            }
            _allProducts = [...productsList];
            productsList.clear;

            productsList = getProductByCategory(kBoards, _allProducts);
            return Center(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.4),
                itemCount: productsList?.length ?? 0,
                itemBuilder: (context, index) => GestureDetector(
                  child: Column(
                    children: [
                      // Image.network(productsList[index].img),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductInfo(
                                      product: productsList[index],
                                    )));
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
        });
  }
}
