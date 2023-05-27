import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;

  const CustomDropDownButton({super.key, required this.items, required this.controller});
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          onTap: () {
            setState(() {
              widget.controller.text = value;
            });
          },
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
