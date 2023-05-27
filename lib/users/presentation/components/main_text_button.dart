import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final TextStyle? textStyle;

  const MainTextButton({super.key, required this.text, required this.function,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: function, child: Text(text,style: textStyle,));
  }
}