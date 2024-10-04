import 'package:final_project/product_constructer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'checkout.dart';

class Cart extends StatefulWidget {
  final Product cartProduct;
  const Cart({super.key, required this.cartProduct});

  @override
  // ignore: library_private_types_in_public_api
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    total = widget.cartProduct.price * quantity;
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
      total = widget.cartProduct.price * quantity;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        total = widget.cartProduct.price * quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/logo.jpg'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductConstlist.hasItems
            ? Column(children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            widget.cartProduct.imageUrl,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cartProduct.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rs. ${widget.cartProduct.price.toString()}",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Quantity:  ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.exposure_minus_1),
                                    onPressed: decrementQuantity,
                                    hoverColor: Colors.amber,
                                  ),
                                  Text(
                                    "$quantity",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.plus_one),
                                    onPressed: incrementQuantity,
                                    hoverColor: Colors.amber,
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  ProductConstlist.hasItems = false;
                                  Get.offAll(const HomeScreen());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Cart clear')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            : const Center(
                child: Text(
                  'No items in the cart',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
      ),
      bottomNavigationBar: ProductConstlist.hasItems
          ? BottomAppBar(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Price : Rs. $total"),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF4C331)),
                        onPressed: () {
                          Get.to(Checkout(
                            cartProduct: widget.cartProduct,
                            quantity: quantity,
                            total: total,
                          ));
                        },
                        child: const Text('Proceed to checkout',style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ]),
            )
          : null,
    );
  }
}

