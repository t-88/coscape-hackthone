


import 'package:coscape_mobile/consts/routes.dart';
import 'package:get/get.dart';

class SurveyControler extends GetxController {
  var show_survey_details = false.obs;

  void view_survey_details() {
    show_survey_details.value = true;
  }
  void hide_survey_details() {
    show_survey_details.value = false;
  }

  void start_survey() {
    Get.toNamed(Routes.survey_questions_page);
  }


}