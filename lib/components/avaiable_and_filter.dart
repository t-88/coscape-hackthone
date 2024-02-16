import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailableAndFilter extends StatelessWidget {
  const AvailableAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Available Today",
            style: TextStyle(
              color: Color(0xFF5d5fef),
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          SvgPicture.asset("assets/Filter.svg"),
        ],
      ),
    );
  }
}
