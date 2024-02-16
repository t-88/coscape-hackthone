
import 'package:coscape_mobile/components/icon_text.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PesonalInfoCard extends StatelessWidget {
  const PesonalInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.BlueColor,
                ),
              ),
              Icon(
                Icons.edit,
                color: AppColors.BlueColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          IconText(
            icon: Icon(
              Icons.phone,
              color: AppColors.TextGreyColor,
            ),
            text: "+213 1234567890",
          ),
          IconText(
            icon: Icon(
              Icons.email,
              color: AppColors.TextGreyColor,
            ),
            text: "MokraneSmith@gmail.com",
          ),
          IconText(
            icon: Icon(
              Icons.location_on,
              color: AppColors.TextGreyColor,
            ),
            text: "Tizi-ouzo, Algeria",
          ),
          IconText(
            icon: Icon(
              Icons.credit_card,
              color: AppColors.TextGreyColor,
            ),
            text: "57575*****5646",
          ),
        ],
      ),
    );
  }
}