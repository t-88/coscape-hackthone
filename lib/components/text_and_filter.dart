import 'package:coscape_mobile/components/custom_drop_down_menu.dart';
import 'package:flutter/material.dart';

class TextAndFilter extends StatelessWidget {
  TextAndFilter({
    super.key,
    required this.text,
    this.show_date = true,
    this.show_price = true,
  });

  final String text;

  bool show_price;
  bool show_date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF5d5fef),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          show_price ?  CustomDropDownMenu(values : ["Prices","A","B","C"]) : SizedBox(),
          show_date ? CustomDropDownMenu(values : ["Date","A","B","C"]) : SizedBox(),
        ],
      ),
    );
  }
}
