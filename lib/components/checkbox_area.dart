

import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/state/survey_questions_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckboxArea extends StatelessWidget {
  const CheckboxArea({
    super.key,
    required this.survey_questions_controler,
  });

  final SurveyQuestionsControler survey_questions_controler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Answer single question",
            style: TextStyle(
              color: AppColors.BlueColor,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 15),
        Obx(
          () => Column(
            children: [
              ...List.generate(
                survey_questions_controler.max_questions.value,
                (index) => Column(
                  children: [
                    CheckboxListTile(
                      title: Text(
                          survey_questions_controler.questions.value[index]),
                      value: survey_questions_controler.cur_checkbox.value ==
                          index,
                      onChanged: (val) =>
                          survey_questions_controler.checkbox_selected(index),
                      controlAffinity: ListTileControlAffinity.leading,
                      checkboxShape: CircleBorder(),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Obx(
            () => ElevatedButton(
              onPressed: survey_questions_controler.cur_checkbox.value == -1
                  ? null
                  : survey_questions_controler.next_question,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.BlueColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
