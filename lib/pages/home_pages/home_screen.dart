import 'information_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart.dart';
import '../constructer/product_constructer.dart';
import 'product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductConstlist list = ProductConstlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.jpg',
          ),
        ),
        leadingWidth: 150,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to( Cart(cartProduct: list.product[1],));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to(const Information());
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: list.product.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 10.0,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    list.listLink(index),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Text(list.listName(index)),
                Text('Rs. ${list.listPrice(index)}',style: const TextStyle(color: Colors.green),),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    Get.to(ProductScreen(product: list.product[index]));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

