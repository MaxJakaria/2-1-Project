import 'package:firebase/UI/login_page.dart';
import 'package:firebase/UI/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUp(String email, String password) async {
    if (email == "" || password == "") {
      UIhelper.customAlertBox(context, "Enter required fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(),
                ),
              ),
            );
      } on FirebaseAuthException catch (ex) {
        UIhelper.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UIhelper.customTextField(
              emailController, "Email", Icons.email, false, context),
          UIhelper.customTextField(
              passwordController, "Password", Icons.key, false, context),

          UIhelper.customTextField(passwordController, "Confirm Password",
              Icons.key, false, context),
          const SizedBox(height: 30),
          //UIhelper.customButton(() {}, "Login", context),
          UIhelper.customButton(() {}, "Sign Up", context),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(fontSize: width * 0.04, color: Colors.black54),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}