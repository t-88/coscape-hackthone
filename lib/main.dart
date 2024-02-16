import 'package:coscape_mobile/components/wraped_drawer.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/pages/done_page.dart';
import 'package:coscape_mobile/pages/survey_page.dart';
import 'package:coscape_mobile/pages/survey_questions_page.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  Get.lazyPut(()=>SurveyControler());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Al-Nachieon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      routes: {
        Routes.surveys_page: (ctx) => WrapedDrawer(widget: SurveyPage()),
        Routes.survey_questions_page: (ctx) => SurveyQuestionsPage(),
        Routes.done_page: (ctx) => DonePage(),
        
      },
      initialRoute: Routes.done_page,
      home: WrapedDrawer(widget: DonePage()),
          
    );
  }
}
