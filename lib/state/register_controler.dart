import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/consts/server.dart';
import 'package:coscape_mobile/state/global_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterControler extends GetxController {
  var first_name_controler = "".obs;
  var last_name_controler = "".obs;
  var email_controler = "".obs;
  var password_controler = "".obs;
  var addr_contoler = "".obs;
  var phone_number_controler = "".obs;
  var is_he_finishing_up = false.obs;

  void register_with_google() {}

  void to_login() {}

  void terms_check_box(bool val) {}

  void date_popup(ctx) async {
    DateTime? date = await showDatePicker(
        context: ctx, firstDate: DateTime(1980), lastDate: DateTime(2100));
  }

  void register() {
    is_he_finishing_up.value = true;
  }

  void finish_profile() async {
    Map<String, dynamic> input = {
      "query": """mutation Mutation(\$user: userInput) {
        regUser(user: \$user) {
          token
          user {
            _id
            email
            name
            phone
          }
        }
      }""",
      "variables": {
        "user": {
          "email":    email_controler.value,
          "name":     first_name_controler.value + " " + last_name_controler.value,
          "password": password_controler.value,
          "phone":    phone_number_controler.value
        }
      }
    };


    print(email_controler.value);
  print(first_name_controler.value + " " + last_name_controler.value);
  print(password_controler.value);
  print(phone_number_controler.value);


    final response = await Dio().post(
      IP_ADDR,
      data: input,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );


      first_name_controler.value = "";
      last_name_controler.value = "";
      email_controler.value = "";
      password_controler.value = "";
      addr_contoler.value = "";
      phone_number_controler.value = "";

    if(response.data["errors"] != null) {
      is_he_finishing_up.value = false;
      Get.snackbar("Error", "Failed to register");
    } else {
      Get.find<GlobalControler>().user_id.value =  response.data["data"]["regUser"]["user"]["_id"];
      Get.find<GlobalControler>().token.value =  response.data["data"]["regUser"]["token"];
      print(Get.find<GlobalControler>().user_id.value);
      print(Get.find<GlobalControler>().token.value);

      
      Get.toNamed(Routes.surveys_page);
    }
  }
}
