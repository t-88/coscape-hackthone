import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/survery_card.dart';
import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final survey_controler = Get.find<SurveyControler>();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppBar(
                title: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Vector (11).svg",
                      width: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              TextAndFilter(
                text: "Finished Surveys",
              ),
              Column(
                children: [
                  ...survey_controler.done_surveys.value.map((survey_data) {
                    if (survey_data["startup"] != null) {
                      return SurveyCard(
                        data: survey_data,
                        on_details: () {},
                        on_start: () {},
                      );
                    }
                    return SizedBox();
                  }).toList(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
