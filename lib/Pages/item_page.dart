import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset(
              'lib/assets/image1.png',
            ),
          )
        ]),
      ),
    );
  }
}
