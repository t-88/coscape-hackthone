
import 'package:coscape_mobile/components/survey_payment.dart';
import 'package:coscape_mobile/components/withdraw_card.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
