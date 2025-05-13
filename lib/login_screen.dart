import 'dart:ui'; // Import this library

import 'package:flutter/material.dart';
import 'package:festeve/signup_screen.dart';
import 'package:festeve/homepage.dart';
import 'package:festeve/button.dart';
import 'package:festeve/textfield.dart';
import 'package:festeve/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'images/logo.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Blurred Background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 5.0), // Use ImageFilter.blur here
              child: Container(
                color:
                    Colors.black.withOpacity(0.5), // Adjust opacity as needed
              ),
            ),
          ),
          // Login UI
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  prefixIcon: Icons.email,
                  hint: "Enter Email",
                  label: "Email",
                  controller: _email,
                ),
                Divider(
                  color: Colors.orangeAccent.withOpacity(0.5),
                  thickness: 1,
                  height: 5,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  prefixIcon: Icons.password,
                  hint: "Enter Password",
                  label: "Password",
                  isPassword: true,
                  controller: _password,
                ),
                Divider(
                  color: Colors.orangeAccent.withOpacity(0.5),
                  thickness: 1,
                  height: 5,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  label: "Login",
                  onPressed: _login,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent, // Change text color
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Doesn't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => goToSignup(context),
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EventPage()),
    );
  }

  void _login() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      goToHome(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }
}
