import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/popup_card.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/consts/colors.dart';
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
                    child: Obx(
                      () => survey_controler.is_loading_surveys.value !=
                              "loading"
                          ? Column(
                              children: [
                                SizedBox(height: 10),
                                TextAndFilter(
                                  text:
                                      survey_controler.surveys.value.length != 0
                                          ? "Available Today"
                                          : "No surveys are available for today",
                                  show_price:
                                      survey_controler.surveys.value.length !=
                                          0,
                                ),
                                ...survey_controler.surveys.value
                                    .asMap()
                                    .map((key, survey) {
                                      return MapEntry(
                                          key,
                                          survey["startup"] != null
                                              ? SurveyCard(
                                                  data: survey,
                                                  on_details: survey_controler
                                                      .view_survey_details,
                                                  on_start: () {
                                                    survey_controler
                                                        .start_survey(
                                                            survey, key);
                                                  },
                                                )
                                              : SizedBox());
                                    })
                                    .values
                                    .toList(),
                              ],
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 50),
                              child: Column(
                                children: [
                                  CircularProgressIndicator(
                                    color: AppColors.BlueColor,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Loading all surveys",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.TextGreyColor),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => survey_controler.show_survey_details.value
                  ? Positioned(
                      child: GestureDetector(
                        onTap: () {
                          survey_controler.hide_survey_details();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            Obx(
              () => survey_controler.show_survey_details.value
                  ? Positioned(
                      child: PopupCard(
                        on_start: survey_controler.start_survey,
                        on_cancel: survey_controler.hide_survey_details,
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
