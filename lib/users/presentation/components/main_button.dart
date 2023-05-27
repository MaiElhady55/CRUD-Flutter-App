import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function() fun;

  const MainButton({super.key, required this.text, required this.fun});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: fun,
      child:  Text(text),
    );
  }
}
