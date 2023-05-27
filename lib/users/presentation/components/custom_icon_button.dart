import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final void Function() function;
  final IconData icon;

  const CustomIconButton({super.key, required this.color, required this.function, required this.icon});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(
          icon,
          color: color,
        ));
  }
}
