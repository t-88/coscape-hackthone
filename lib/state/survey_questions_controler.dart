


import 'package:coscape_mobile/consts/routes.dart';
import 'package:get/get.dart';

class SurveyQuestionsControler extends GetxController {
  var cur_progress = 1.obs;
  var max_questions = 4.obs;
  var cur_checkbox = (-1).obs;

  var cur_rating = (-1).obs;

  var questions = ["Values are objective and shared. You look to social norms","3","2","1"].obs;
  var anwsers = [-1,-1,-1,-1];

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
    Get.toNamed(Routes.surveys_page);
    Get.snackbar("Success", "Your response have been sent");
  }
}