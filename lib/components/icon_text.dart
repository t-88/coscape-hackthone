import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/widgets.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          icon,
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              color: AppColors.TextGreyColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
