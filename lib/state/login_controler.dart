import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/consts/server.dart';
import 'package:coscape_mobile/state/global_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginControler extends GetxController {
  var username_input = "".obs;
  var password_input = "".obs;
  var username_section = true.obs;

  void login_with_google() {}

  void login() async {
    Map<String, dynamic> input = {
      "query": """mutation LoginUser(\$email: String, \$password: String) {
      loginUser(email: \$email, password: \$password) {
        token
        user {
          _id
          email
          name
          pfp
          phone
          wallet
        }
      }
    }""",
      "variables": {
        "email": username_input.value,
        "password": password_input.value
      }
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



    if(response.data["errors"] != null) {
      Get.snackbar("Error", "User not found");
    } else {

      Get.find<GlobalControler>().store_token(response.data["data"]["loginUser"]["token"]);
      Get.find<GlobalControler>().store_id(response.data["data"]["loginUser"]["user"]["_id"]);
      print(Get.find<GlobalControler>().user_id.value);
      print(Get.find<GlobalControler>().token.value);

      Get.toNamed(Routes.surveys_page);
    }
  }

  void forgot_password() {}

  void to_register() {
    Get.toNamed(Routes.register_page);
  }
}
