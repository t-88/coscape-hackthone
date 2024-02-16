import 'package:coscape_mobile/components/card_info.dart';
import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/money_withdraw.dart';
import 'package:coscape_mobile/components/recent_transacation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyMoneyPage extends StatelessWidget {
  const MyMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/Vector (8).svg",
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "My Money",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    CardInfo(),
                    MoneyAndWidthdraw(),
                    RecentTransacations()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


