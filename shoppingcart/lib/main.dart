import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:shoppingcart/components/shoppingcart_detail.dart';
import 'package:shoppingcart/components/shoppingcart_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: const [
          ShoppingCartHeader(),
          ShoppingCartDetail()
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){},
        ),
        SizedBox(width: 16,)
      ],
      elevation: 0.0,
    );
  }
}

