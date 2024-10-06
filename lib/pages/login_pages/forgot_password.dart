import 'package:flutter/material.dart';
import '../../global/common/toast.dart';
import '../../firebase_auth/firebase_auth_services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isSignIn = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();

  void _forgotEmailLink() async {
    setState(() {
      _isSignIn = true;
    });

    String email = _emailController.text;

    await _auth.forgotPassword(email);

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
              "Forgot Password",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Enter Email to reset password link:",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF4C331)),
                onPressed: (){
                  _forgotEmailLink();
                  showToast(message: "Link sent to your email");
                },
                child: _isSignIn
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : const Text(
                        "Send Link",
                        style:
                            TextStyle(color: Color(0xff000000), fontSize: 18),
                      )),
          ],
        ),
      ),
    );
  }
}
