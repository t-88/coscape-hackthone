import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/popup_card.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyPage extends StatelessWidget {
  SurveyPage({super.key});

  final survey_controler = Get.put(SurveyControler());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ri_survey-line.svg",
                        width: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Surveys",
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
                        TextAndFilter(text: "Available Today",),
                        SurveyCard(
                            on_details: survey_controler.view_survey_details,
                            on_start: survey_controler.start_survey),
                        SurveyCard(
                            on_details: survey_controler.view_survey_details,
                            on_start: survey_controler.start_survey),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () {
                if (survey_controler.show_survey_details.value) {
                  return Positioned(
                    child: PopupCard(
                      on_start: survey_controler.start_survey,
                      on_cancel: survey_controler.hide_survey_details,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
