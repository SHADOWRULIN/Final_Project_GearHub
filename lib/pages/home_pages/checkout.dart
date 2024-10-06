import 'package:final_project/pages/home_pages/home_screen.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import '../constructer/product_constructer.dart';
import 'package:get/get.dart';
import 'product_card.dart';

class Checkout extends StatefulWidget {
  final Product cartProduct;
  final int quantity;
  final double total;
  const Checkout(
      {super.key,
      required this.cartProduct,
      required this.quantity,
      required this.total});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool? isChecked = true;
  double deliverCharges = 200;
  double completeTotal = 0;

  void total() {
    completeTotal = widget.total + deliverCharges;
  }

  void confirmOrder() {
    Get.snackbar(
      'Order confirmed!',
      'Your order has been placed successfully.',
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  @override
  void initState() {
    super.initState();
    total();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cardStyle(widget.cartProduct.imageUrl, widget.cartProduct.name,
                widget.cartProduct.price, widget.quantity),
            const Text(
              "Shipping Address :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CheckboxListTile(
              title: const Text("Address from the Address Book"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Text(
              "Payment Method :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CheckboxListTile(
              title: const Text("Cash on delivery"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: BottomAppBar(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subtotal : Rs. ${widget.total}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Delivery Charges : Rs. $deliverCharges",
                  style: const TextStyle(fontSize: 14),
                ),
                const Divider(
                  color: Colors.black, // Color of the line
                  height: 20, // Space around the line
                  thickness: 2, // Thickness of the line
                  indent: 10, // Start padding
                  endIndent: 10, // End padding
                ),
                Text(
                  "Total : Rs. $completeTotal",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF4C331)),
                    onPressed: () {
                      confirmOrder();
                      Get.offAll(OrderComplete(
                          cartProduct: widget.cartProduct,
                          quantity: widget.quantity));
                    },
                    child: const Text(
                      'Place Order',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class OrderComplete extends StatelessWidget {
  final Product cartProduct;
  final int quantity;
  const OrderComplete({
    super.key,
    required this.cartProduct,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/logo.jpg'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30,
            ),
            const Text(
              "Your order has been placed",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            cardStyle(cartProduct.imageUrl, cartProduct.name, cartProduct.price,
                quantity),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Get.offAll(const HomeScreen());
                orderController.addOrder(cardStyle(cartProduct.imageUrl,
                    cartProduct.name, cartProduct.price, quantity));
                ProductConstlist.hasProduct = true;
              },
              child: const Text(
                "Continue Shopping =>",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo.jpg'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Orders",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              ProductConstlist.hasProduct
                  ? Expanded(
                    child: Obx(() => ListView.builder(
                          itemCount: orderController.orders.length,
                          itemBuilder: (context, index) {
                            return orderController.orders[index];
                          },
                        )),
                  )
                  : const Center(
                      child: Text(
                        'No Orders Yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
            ],
          ),
        ));
  }
}
