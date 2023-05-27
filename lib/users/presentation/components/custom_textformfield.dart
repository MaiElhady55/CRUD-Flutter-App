import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final String? Function(String? val) validator;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.type,
      required this.validator,
      this.suffixIcon ,
      required this.textInputAction,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
        decoration: TextDecoration.none, decorationThickness: 0),
        validator: validator,
        textInputAction: textInputAction,
        controller: controller,
        autocorrect: false,
        keyboardType: type,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: const Color(0xffF4F5F7),
          filled: true,
          contentPadding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 16),
          hintText: hintText,
          hintStyle:const TextStyle(fontSize: 14),
          suffixIcon:suffixIcon ,
        ));
  }
}
