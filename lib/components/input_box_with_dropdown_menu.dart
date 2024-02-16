
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputboxWithDropdownMenu extends StatelessWidget {
  const InputboxWithDropdownMenu({
    super.key,
  });

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
        borderRadius: BorderRadius.circular(5),
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: "Select your gender",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintStyle: TextStyle(color: AppColors.TextGreyColor),
          filled: true,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: "Male",
            isDense: true,
            onChanged: (_) {},
            items: ["Male", "Female"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

