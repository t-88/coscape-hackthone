import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingInputBox extends StatelessWidget {
  SettingInputBox({
    super.key,
    required this.hint,
    this.is_number = false,
  });

  final String hint;
  bool is_number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, color: Colors.grey.withOpacity(0.5)),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        keyboardType: is_number ? TextInputType.number : TextInputType.name,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}

