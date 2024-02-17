
import 'package:coscape_mobile/components/ratings_row.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/state/survey_questions_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RatingArea extends StatelessWidget {
  const RatingArea({
    super.key,
    required this.survey_questions_controler,
  });

  final SurveyQuestionsControler survey_questions_controler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "How much would you rate this particular feature?",
          style: TextStyle(
            color: AppColors.BlueColor,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Obx(
          () => RatingRow(
            cur_rating:
                survey_questions_controler.cur_rating.value,
            on_select_rating: survey_questions_controler.on_select_rating
          ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            Text(
              "Leave a feedBack +10DA",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.BlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
              hintText: "Type your anwer here",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.BlueColor,
                ),
                gapPadding: 0,
              ),
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.BlueColor,
                ),
              ),
              filled: true,
              fillColor: Color(0xFF5D5FEF).withOpacity(0.1),
              hintStyle: TextStyle(
                color: AppColors.BlueColor,
                fontSize: 13,
              )),
        ),
        SizedBox(height: 20),
        Obx(
          () =>  Container(
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              onPressed: survey_questions_controler
                          .cur_rating.value ==
                      -1
                  ? null
                  : survey_questions_controler.submit_data,
              child: Text(
                "Submit!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.BlueColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

