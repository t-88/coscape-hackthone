
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
