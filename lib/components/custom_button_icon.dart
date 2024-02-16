
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/widgets.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    required this.icon,
    required this.selected,
    required this.on_click,
    
  });

  final Widget icon;
  final bool selected;
  final Function on_click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () { on_click(); },
      child: Container(
        width: 45,
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(7),
        child: icon,
        decoration: BoxDecoration(
          color: !selected ? AppColors.GreyColor : AppColors.BlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
