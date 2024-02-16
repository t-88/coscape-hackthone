import 'package:coscape_mobile/components/measure_size.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.surveys_page);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 6,
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MeasureSize(
                  onChange: (size) {
                    Get.find<SurveyControler>().set_card_height(size);
                  },
                  child: SvgPicture.asset(
                    "assets/FINAL_FINAL_LOGO.svg",
                    width: 60,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Express",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Check more surveys",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                height: Get.find<SurveyControler>().card_height.value,
                padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "8 min ago",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: AppColors.TextGreyColor,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(69),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
