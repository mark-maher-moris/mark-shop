import 'package:flutter/material.dart';
import '/Pages/item_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        elevation: 20,
        actions: [
          Row(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_basket,
                        color: Colors.black,
                      )),
                  Container(
                    child: Text(
                      '3',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 117, 26, 90),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
              Text(
                '50\$',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 255, 200),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 5),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemPage())),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('lib/assets/image1.png'),
                        ),
                        Text(
                          'HeadPhons',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20),
                        ),
                        Text(
                          '20 ponds',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 144, 205),
                              fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
