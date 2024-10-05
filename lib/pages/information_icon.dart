import 'package:final_project/pages/address.dart';
import 'package:final_project/pages/checkout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/logo.jpg'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.to(const Address());
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 30, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "Address Book",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const Orders());
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shop_2, size: 30, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      "Orders",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const LogOut());
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 30, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      "Log Out",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOG OUT",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Are you sure you want to leave?",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 294,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6DA4AA)),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Stay",
                      style: TextStyle(color: Color(0xff000000), fontSize: 18),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 294,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE3E3E3)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.offAll(const LoginPage());
                    },
                    child: const Text(
                      "Log out",
                      style: TextStyle(color: Color(0xff000000), fontSize: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}