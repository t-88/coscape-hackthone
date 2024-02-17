import 'package:coscape_mobile/components/checkbox_area.dart';
import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/progress_bar.dart';
import 'package:coscape_mobile/components/rating_area.dart';
import 'package:coscape_mobile/state/survey_questions_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyQuestionsPage extends StatelessWidget {
  SurveyQuestionsPage({super.key});


  final survey_questions_controler = Get.find<SurveyQuestionsControler>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/fact.svg",
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Survey Questions",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => survey_questions_controler.cur_progress != 1
                    ? GestureDetector(
                        onTap: survey_questions_controler
                            .back_to_preveiws_question,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.grey.withOpacity(0.5),
                              size: 28,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox()),
                Obx(
                  () => Text(
                    survey_questions_controler.cur_progress.value.toString() +
                        "/" +
                        survey_questions_controler.max_questions.value
                            .toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => ProgressBar(
                progress: survey_questions_controler.cur_progress.value /
                    survey_questions_controler.max_questions.value,
              )),
          SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      "assets/Video_player.png",
                      width: 300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => survey_questions_controler.cur_progress !=
                            survey_questions_controler.max_questions
                        ? CheckboxArea(
                            survey_questions_controler:
                                survey_questions_controler,
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: RatingArea(
                              survey_questions_controler:
                                  survey_questions_controler,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
