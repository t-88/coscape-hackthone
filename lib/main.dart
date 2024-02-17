import 'package:coscape_mobile/pages/login_page.dart';
import 'package:coscape_mobile/pages/register_page.dart';
import 'package:coscape_mobile/pages/wraped_drawer.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/pages/done_page.dart';
import 'package:coscape_mobile/pages/my_money_page.dart';
import 'package:coscape_mobile/pages/notification_page.dart';
import 'package:coscape_mobile/pages/profile_page.dart';
import 'package:coscape_mobile/pages/setting_page.dart';
import 'package:coscape_mobile/pages/survey_page.dart';
import 'package:coscape_mobile/pages/survey_questions_page.dart';
import 'package:coscape_mobile/pages/transacation_page%20copy.dart';
import 'package:coscape_mobile/state/global_store.dart';
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:coscape_mobile/state/survey_questions_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.lazyPut(() => SurveyControler());
  Get.lazyPut(() => SurveyQuestionsControler());
  Get.lazyPut(() => GlobalControler());


  // check if user is already is logged in/ registerd using tokens and 
  // skip the login page if he is
  await GetStorage.init();
  GetStorage box = GetStorage();
  var token = box.read("token");

  if(token != null) {
    Get.find<GlobalControler>().check_token_lifespan(token);
  }

  

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      routes: {
        Routes.surveys_page: (ctx) => WrapedDrawer(widget: SurveyPage()),
        Routes.survey_questions_page: (ctx) => WrapedDrawer(widget: SurveyQuestionsPage()),
        Routes.done_page: (ctx) => WrapedDrawer(widget: DonePage()),
        Routes.profile_page: (ctx) => WrapedDrawer(widget: ProfilePage()),
        Routes.my_money_page: (ctx) => WrapedDrawer(widget: MyMoneyPage()),
        Routes.transacation_page: (ctx) =>WrapedDrawer(widget: TransactionPage()),
        Routes.notification_page: (ctx) => WrapedDrawer(widget: NotificationPage()),
        Routes.setting_page: (ctx) => WrapedDrawer(widget: SettingPage()),
        Routes.login_page: (ctx) => LoginPage(),
        Routes.register_page: (ctx) => RegisterPage(),
      },
      initialRoute: Routes.surveys_page,
      home: SurveyPage(),
    );
  }
}
