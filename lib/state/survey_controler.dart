


import 'package:coscape_mobile/consts/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SurveyControler extends GetxController {
  var show_survey_details = false.obs;

  var card_height = (100.0).obs;

  void view_survey_details() {
    show_survey_details.value = true;
  }
  void hide_survey_details() {
    show_survey_details.value = false;
  }

  void start_survey() {
    Get.toNamed(Routes.survey_questions_page);
  }

  void set_card_height(Size size) {
    card_height.value = size.height;
  }


}