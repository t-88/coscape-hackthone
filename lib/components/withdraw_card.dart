import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithdrawCard extends StatelessWidget {
  const WithdrawCard({super.key, required this.money, required this.date});

  final String money;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/Icon.svg"),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Withdraw to main card"),
                  Text(
                    date,
                    style: TextStyle(color: AppColors.TextGreyColor),
                  ),
                ],
              ),
            ],
          ),
          Text(
            money,
            style: TextStyle(
              color: money[0] == "-" ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
