import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/notification_card.dart';
import 'package:coscape_mobile/components/survey_payment.dart';
import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/components/withdraw_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            show_notfication : false,
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/Huge-icon.svg",
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Notification",
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
                  TextAndFilter(text: "Notification History",show_price:  false,),
                  // fill the page with template data
                  NotificationCard(),                
                  NotificationCard(),                
                  NotificationCard(),                
                  NotificationCard(),                
                  NotificationCard(),                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
