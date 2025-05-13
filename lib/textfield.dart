import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final Color iconColor; // Added a parameter for icon color
  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.hint,
    required this.label,
    required this.controller,
    this.iconColor = Colors.orange,
    this.isPassword = false,
  });
  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: isPassword,
        controller: controller,
        style: const TextStyle(color: Colors.orange),
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            label: Text(label),
            labelStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none));
    // OutlineInputBorder(

    //  borderRadius: BorderRadius.circular(6),
    // borderSide: const BorderSide())),);
  }
}
