import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/get_routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA9qjZF7i6nDBSd4Y0t-1ZnqNGY_E0EzYE",
        appId: "1:608437832986:web:ddbc1567d4237e16fe30a3",
        messagingSenderId: "608437832986",
        projectId: "final-project-3-9098f",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  
  Get.put(OrderController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gear Hub",
      theme: ThemeData(primarySwatch: Colors.amber),
      getPages: GetAppRoute().getRoutes(),
      // home: const HomeScreen(),
    );
  }
}

class OrderController extends GetxController {
  var orders = <Widget>[].obs;

  void addOrder(Widget order) {
    orders.add(order);
  }
}
