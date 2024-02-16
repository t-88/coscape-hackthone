import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyAndWidthdraw extends StatelessWidget {
  const MoneyAndWidthdraw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("YOUR MONEY"),
              Text(
                "80000.00DA",
                style: TextStyle(
                  color: AppColors.BlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.BlueColor,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                SvgPicture.asset("assets/bx_money-withdraw.svg"),
                SizedBox(width: 5),
                Text(
                  "WITHDRAW",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
