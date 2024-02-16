import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/personal_card_info.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// NOTE: profile imgs should have the dimentions 155x230
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Container(child: SvgPicture.asset("assets/w.svg")),
              ],
            ),
          ),
         
          Column(
            children: [
              CustomAppBar(
                title: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Group.svg",
                      width: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Profile",
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
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, 30),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: Image.asset("assets/ellipse.png"),
                          ),
                          Text(
                            "Mokrane Smith",
                            style: TextStyle(
                              color: AppColors.BlueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kabylien cat",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                          PesonalInfoCard(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recent Finished Surveys",
                                    style: TextStyle(
                                      color: AppColors.BlueColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.done_page);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "SEE ALL",
                                          style: TextStyle(
                                            color: AppColors.TextGreyColor,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColors.TextGreyColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SurveyCard(on_details: () {}, on_start: () {}),
                            SurveyCard(on_details: () {}, on_start: () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


