import 'package:festeve/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:festeve/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController forgetPasswordController = TextEditingController();
  late TextEditingController emailController;
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: const Text('Forgot Password ?'),
      //),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black,
              Colors.grey,
              //Colors.green,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey,
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                padding: const EdgeInsets.all(2.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Allura',
                        fontSize: 29,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Icon(
                      Icons.lightbulb_outline_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Trouble logging in?',
                    style: TextStyle(
                      fontFamily: 'Allura',
                      fontSize: 18,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Enter your email and we will send you a link.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 30,
              ),
              TextFormField(
                controller: forgetPasswordController,
                decoration: const InputDecoration(
                  hintText: 'email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
                width: 30,
              ),
              // TextFormField(
              //   controller: otpController,
              //   decoration: InputDecoration(
              //     hintText: 'OTP',
              //     hintStyle: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 40, width: 30),
              ElevatedButton(
                onPressed: () async {
                  var forgotEmail = forgetPasswordController.text.trim();
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                              print("email sent"),
                              Get.off(() => const LoginScreen()),
                            });
                  } on FirebaseAuthException catch (e) {
                    print("error $e");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  // Implement logic to verify OTP and reset password
                  String email = emailController.text.trim();
                  String otp = otpController.text.trim();
                  print("Email: $email, OTP: $otp");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set button background color
                  foregroundColor: Colors.white, // Set font color
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 50), // Set padding
                ),
                child: const Text('Reset password'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
