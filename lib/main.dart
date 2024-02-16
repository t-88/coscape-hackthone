import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/pages/survey_page.dart';
import 'package:coscape_mobile/pages/survey_questions_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Al-Nachieon',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      routes: {
        Routes.surveys_page : (ctx) => SurveyPage(),
        Routes.survey_questions_page : (ctx) => SurveyQuestionsPage(),
      },
      initialRoute: Routes.surveys_page,
      home: SurveyPage(),
    );
  }
}