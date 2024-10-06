import 'package:final_project/firebase_auth/firebase_auth_services.dart';
import 'package:final_project/global/common/toast.dart';
import 'package:final_project/pages/login_pages/create_acc.dart';
import 'package:final_project/pages/home_pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool _obscureText = true;
  bool _isSignIn = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    setState(() {
      _isSignIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSignIn = false;
    });

    if (user != null) {
      showToast(message: ("User successfully logged in"));
      Get.offAll(const HomeScreen());
    } else {
      showToast(message: ("Some error happened"));
    }
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
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 200),
              child: GestureDetector(
                onTap: () {
                  Get.to(const ForgotPassword());
                },
                child: const Text(
                  "Forget your password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Color(0xff374951),
                    decoration: TextDecoration.underline,
                  ),
                )),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF4C331)),
                  onPressed: _signIn,
                  child: _isSignIn
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Text(
                          "Log In",
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 18),
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
          ],
        ),
      ),
    );
  }
}

