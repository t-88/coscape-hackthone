import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/consts/server.dart';
import 'package:coscape_mobile/state/survey_questions_controler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SurveyControler extends GetxController {
  var show_survey_details = false.obs;

  var surveys = [].obs;
  var done_surveys = [].obs;
  var survey_details = {}.obs;
  int survey_idx = 0;
  var card_height = (100.0).obs;
  var is_loading_surveys = "loading".obs;

  @override
  void onInit() {
    super.onInit();
    // load todays surveys
    request_list_of_surveys();
  }


  
  void view_survey_details() {
    show_survey_details.value = true;
  }
  void hide_survey_details() {
    show_survey_details.value = false;
  }
  void set_card_height(Size size) {
    card_height.value = size.height;
  }

  void request_list_of_surveys() async {
    is_loading_surveys.value = "loading";

    Map<String, dynamic> input = {
      "query": """
          query Query {
            surveys {
              questions {
                choices
                question
              }
              reward
              startup {
                name
                shortDesc
                desc
               dateOfCreation
              }
              video
              eta
              feedbacks {
                question
              }
            }
          }
          """,
    };
    final response = await Dio().post(
      IP_ADDR,
      data: input,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    surveys.value = response.data["data"]["surveys"];
    // remove un-complete data
    for(var i = surveys.value.length - 1; i >= 0 ; i--) {
      if(surveys.value[i]["startup"] == null) {
        surveys.value.removeAt(i);
      }
    }

    is_loading_surveys.value = "loaded";
  }
  void start_survey(survey_data, idx) {
    survey_details.value = survey_data;
    survey_idx = idx;

    final survey_questions_controler = Get.find<SurveyQuestionsControler>();
    survey_questions_controler.load_survey_questions();

    Get.toNamed(Routes.survey_questions_page);
  }
  void mark_survey_done() {
    done_surveys.value.add(surveys.value[survey_idx]);
    surveys.value.removeAt(survey_idx);
    surveys.value = surveys.value;
  }
}
