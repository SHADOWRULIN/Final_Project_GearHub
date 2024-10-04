// import 'package:final_project/app_routes.dart';
import 'package:final_project/firebase_auth/firebase_auth_services.dart';
import 'package:final_project/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool _obscureText = true;
  bool _isSignIn = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  Future<void> _signIn() async {
    setState(() {
      _isSignIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print("User is successfully logged in");
      Get.offAll(HomeScreen());
    } else {
      print("Some error happened");
    }

    setState(() {
      _isSignIn = false;
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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login In",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (String value) {},
              controller: _emailController,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 200),
              child: Text(
                "Forget your password?",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF4C331)),
                  onPressed: _signIn,
                  child: const Text(
                    "Log In",
                    style: TextStyle(color: Color(0xff000000), fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(const CreateAcc());
                },
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Color(0xff374951),
                    decoration: TextDecoration.underline,
                  ),
                )),
                if (_isSignIn)
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool _obscureText = true;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Enter User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (String value) {},
              controller: _usernameController,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (String value) {},
              controller: _emailController,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF4C331)),
                  onPressed: _signUp,
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Color(0xff000000), fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String userName = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print("user is successfully created");
      Get.offAll(HomeScreen());
    } else {
      print("Some error happend");
    }
  }
}
