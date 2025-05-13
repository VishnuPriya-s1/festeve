import 'dart:developer';

import 'package:festeve/auth_service.dart';
import 'package:festeve/homepage.dart';
import 'package:festeve/login_screen.dart';
import 'package:festeve/home_screen.dart';
import 'package:festeve/button.dart';
import 'package:festeve/textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          padding: const EdgeInsets.only(top: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create An Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                prefixIcon: Icons.person,
                hint: "Enter Name",
                label: "Name",
                controller: _name,
              ),
              Divider(
                color: Colors.orangeAccent.withOpacity(0.5),
                thickness: 1,
                height: 3,
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              CustomTextField(
                prefixIcon: Icons.lock,
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
              Padding(padding: EdgeInsets.only(top: 15.0)),
              const SizedBox(height: 10),
              CustomButton(
                label: "Signup",
                onPressed: _signup,
              ),
              //Padding(padding: EdgeInsets.only(top: 10.0)),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () => goToLogin(context),
                  child:
                      const Text("Login", style: TextStyle(color: Colors.red)),
                )
              ]),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  Widget buildTextField(
    TextEditingController controller,
    IconData icon,
    String label, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          //contentPadding:
          //const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.orange),
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }

  _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User Created Succesfully");
      // ignore: use_build_context_synchronously
      goToHome(context);
    }
  }
}
//   _signup() async {
//     // Check if the email already exists
//     final List<String> signInMethods =
//     await _auth.fetchSignInMethodsForEmail(_email.text);
//     if (signInMethods.isEmpty) {
//       // Email is not associated with any user account, proceed with signup
//       try {
//         final user = await _auth.createUserWithEmailAndPassword(
//             _email.text, _password.text);
//         if (user != null) {
//           log("User Created Successfully");
//           // Navigate to the home screen after successful signup
//           goToHome(context);
//         }
//       } catch (e) {
//         // Handle signup errors
//         print("Error creating user: $e");
//         // Optionally, show an error message to the user
//       }
//     } else {
//       // Email is already associated with a user account
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Email already exists"),
//         ),
//       );
//       // Optionally, show an error message to the user
//     }
//   }
// }
