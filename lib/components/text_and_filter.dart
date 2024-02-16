import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextAndFilter extends StatelessWidget {
  const TextAndFilter({
    super.key,
    required this.text,
  });

  final String text;

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
          CustomDropDownMenu(values : ["Prices","A","B","C"]),
          CustomDropDownMenu(values : ["Date","A","B","C"]),
        ],
      ),
    );
  }
}

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.values 
  });

  final List<String> values; 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: AppColors.GreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        value: values[0],
        underline: SizedBox(),
        items: values
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (_) {},
      ),
    );
  }
}
