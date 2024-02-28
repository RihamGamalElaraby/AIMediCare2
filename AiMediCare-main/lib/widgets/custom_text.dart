import 'package:flutter/material.dart';

Widget customTextField({
  required String? hinttext,
  Widget? icon,
  void Function(String)? onChanged,
  void Function()? onSubmitter,
  bool obscureText = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ),
    );

Widget customtext2({
  required String text,
  required BuildContext context,
  VoidCallback? onPressed,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
