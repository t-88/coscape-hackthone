import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/personal_card_info.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/components/survey_payment.dart';
import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/components/withdraw_card.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/grommet-icons_transaction.svg",
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Transaction",
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
              child: Column(
                children: [
                  TextAndFilter(text: "Transaction History"),
                  WithdrawCard(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  WithdrawCard(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                 SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  WithdrawCard(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                 SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),
                  WithdrawCard(money: "50.0 da", date: "20.02.2023"),
                  SurveyPayment(money: "50.0 da", date: "20.02.2023"),                                    
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
