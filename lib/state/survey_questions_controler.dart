


import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:get/get.dart';

class SurveyQuestionsControler extends GetxController {
  var cur_progress = 1.obs;
  var max_questions = 4.obs;
  var cur_checkbox = (-1).obs;
  var cur_rating = (-1).obs;

  var questions = [].obs;
  var anwsers = [-1,-1,-1,-1];


  @override
  void onInit() {
    super.onInit();
  }

  void load_survey_questions() {
    var survey_controler =  Get.find<SurveyControler>();
    questions.value = survey_controler.survey_details.value["questions"];

    cur_progress.value = 1;
    max_questions.value = questions.value.length;
    cur_checkbox.value = -1;
    cur_rating.value = -1;
    anwsers = [];

    // reset answers array
    for(var _ in questions) {
      anwsers.add(-1);
    }    
  }

  void checkbox_selected(int index) {
    if(cur_checkbox.value == index) {
      cur_checkbox.value = -1;
    } 
    cur_checkbox.value = index;
    anwsers[index] = cur_checkbox.value;

    
  }

  void next_question() {
    cur_progress.value += 1;
    if(cur_progress.value < max_questions.value) {
      cur_checkbox.value = anwsers[cur_progress.value];
    } else {
      cur_checkbox.value = -1;
    }
  }
  void back_to_preveiws_question() {
    cur_progress.value -= 1;
    cur_checkbox.value = anwsers[cur_progress.value];
  }

  void on_select_rating(int rating) {
    cur_rating.value = rating;
  }

  void submit_data() {
    
    Get.find<SurveyControler>().mark_survey_done();


    Get.toNamed(Routes.surveys_page);

    Get.snackbar("Thank you", "Your response have been successfully sent");
  }
}