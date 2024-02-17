import 'package:coscape_mobile/components/custom_icon_button.dart';
import 'package:coscape_mobile/components/gradient_button.dart';
import 'package:coscape_mobile/components/text_devider.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/state/login_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final login_controler = Get.put(LoginControler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Hi there,"),
                    SizedBox(height: 10),
                    Text(
                      "Wellcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {login_controler.username_input.value = value; },
                      decoration: InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFF7F8F8),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {login_controler.password_input.value = value;},
                      decoration: InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFF7F8F8),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: login_controler.forgot_password,
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Obx( () =>   GradientButton(
                      enabled : login_controler.username_input.value != "" && login_controler.password_input.value != "",
                      callback: login_controler.login,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    TextDevider(),
                    SizedBox(height: 20),
                    CustomIconButton(
                        callback: login_controler.login_with_google),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account yet?"),
                          SizedBox(width: 4),
                          GestureDetector(
                            onTap: login_controler.to_register,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: AppColors.BlueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
