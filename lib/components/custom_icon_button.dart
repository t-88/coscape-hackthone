
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function callback;
  const CustomIconButton({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { callback(); },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Image(
            image: AssetImage("assets/gmail.png"),
          ),
        ),
      ),
    );
  }
}