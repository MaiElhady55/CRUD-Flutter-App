import 'package:flutter/material.dart';
import 'package:rise_up_task/core/utils/styles.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;

  const CustomRichText({super.key, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: text1, style: Styles.textStyle18, children: [
      TextSpan(
          text: text2,
          style: Styles.textStyle18.copyWith(color: Colors.black))
    ]));
  }
}
