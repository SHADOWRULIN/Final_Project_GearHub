import 'package:final_project/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'information_icon.dart';
import 'constructer/product_constructer.dart';
import 'cart.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.jpg'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to( Cart(cartProduct: product,));
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(product.imageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Rs. ${product.price.toString()}",
                    style: const TextStyle(fontSize: 24, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < product.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  );
                }),
              ),
              Text(
                "Rating : ${product.rating.toString()}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                "The best of road cycling, mountain biking, and cross-training. With its hybrid design, it's the perfect companion for adventurous cyclists looking to conquer various terrains, from city streets to rugged trails.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  CircleAvatar(backgroundColor: Colors.red),
                  CircleAvatar(backgroundColor: Colors.yellow),
                  CircleAvatar(backgroundColor: Colors.black),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(Checkout(cartProduct: product, quantity: 1, total: product.price));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ProductConstlist.hasItems= true;
                      Get.defaultDialog(
                        title: "Item Added to cart succesfully",
                        middleText: "",
                        textConfirm: "Go to Cart",
                        textCancel: "Go Back",
                        onConfirm: () {
                          Get.to(Cart(cartProduct: product,)); // Close the dialog
                        },
                        onCancel: () {
                          Get.back(); // Close the dialog
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF4C331),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




