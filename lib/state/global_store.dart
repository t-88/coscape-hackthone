

import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/consts/server.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class GlobalControler extends GetxController  {
  var user_id = "".obs;
  var token  = "".obs;

  var email = "";
  var phone_number = "";



  void store_token(_token) {
    token.value = _token;
    GetStorage box = GetStorage();
    box.write("token",token.value);
  }
  void store_id(_id) {
    token.value = _id;
    GetStorage box = GetStorage();
    box.write("id",token.value);
  }


  void check_token_lifespan(token) async {
    final dio =  new Dio();
    dio.options.headers["authorization"] = token;

    // send a query if failed that means that the token is no good
    Map<String, dynamic> input = {
      "query":
      """query Query {
      users {
        _id
      }
    }""" 
    };


    final res =  await dio.post(IP_ADDR,data: input);
    if(res.data["success"] != null && !res.data["success"]) {
      Get.toNamed(Routes.login_page);
    } else {
      load_id_from_storage();
      Get.toNamed(Routes.surveys_page);
    }


  }
  void load_id_from_storage() {
    GetStorage box = GetStorage();
    user_id.value =  box.read("id");
    print(user_id.value);
  }

}