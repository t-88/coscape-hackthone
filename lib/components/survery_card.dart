import 'package:coscape_mobile/components/measure_size.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyCard extends StatelessWidget {
  final Function on_details;
  final Function on_start;
  SurveyCard({
    super.key,
    required this.on_details,
    required this.on_start,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        on_details();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 6,
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey.withOpacity(0.5))
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/FINAL_FINAL_LOGO.svg",
                  width: 80,
                ),
                SizedBox(width: 5),
                MeasureSize(
                  onChange: (size) =>
                      Get.find<SurveyControler>().set_card_height(size),
                  child: Container(
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
                        Text(
                          "Delivery company",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          width: 150,
                          child: Text(
                            "Delivery Express: Swift, Reliable Delivery",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                height: Get.find<SurveyControler>().card_height.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/humbleicons_money.svg",
                              height: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "2.1 min",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColors.BlueColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        on_start();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "50 Da",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF5d5fef),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}
