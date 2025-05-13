/*import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 180,
        height: 42,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(fontSize: 18),
            )));
  }
}*/

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? textStyle; // Optional parameter for text customization

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.textStyle, // Optional parameter for text customization
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180, // Default button width
      height: 42, // Default button height
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.normal),
          // Default style
        ),
      ),
    );
  }
}
