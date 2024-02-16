import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/personal_card_info.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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

class RecentTransacations extends StatelessWidget {
  const RecentTransacations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () { Get.toNamed(Routes.transacation_page);  },
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: AppColors.TextGreyColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              WithdrawCard(date: "08.06.2021", money: "-140.00 da"),
              WithdrawCard(date: "08.06.2021", money: "+140.00 da"),
              SurveyPayment(date: "08.06.2021", money: "+50.00 da"),
              SurveyPayment(date: "08.06.2021", money: "+50.00 da"),
              SurveyPayment(date: "08.06.2021", money: "+50.00 da"),
            ],
          )
        ],
      ),
    );
  }
}

class SurveyPayment extends StatelessWidget {
  const SurveyPayment({super.key, required this.money, required this.date});

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
              SvgPicture.asset("assets/Icon_survey.svg"),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Survey payment"),
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

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/credit_card.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.grey),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card_outlined,
                    color: AppColors.BlueColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Show card details",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.BlueColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.grey),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card_outlined,
                    color: AppColors.BlueColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Show card details",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.BlueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
