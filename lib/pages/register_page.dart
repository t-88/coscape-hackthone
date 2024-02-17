import 'package:coscape_mobile/components/custom_icon_button.dart';
import 'package:coscape_mobile/components/gradient_button.dart';
import 'package:coscape_mobile/components/setting_input_box.dart';
import 'package:coscape_mobile/components/text_devider.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/state/register_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final register_controler = Get.put(RegisterControler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          clipBehavior: Clip.none,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Obx(
            () => !register_controler.is_he_finishing_up.value
                ? RegisterFirstInfo(register_controler: register_controler)
                : RegisterFinishUp(register_controler: register_controler,),
          ),
        ),
      ),
    );
  }
}

class RegisterFinishUp extends StatelessWidget {
  RegisterFinishUp({
    super.key,
    required this.register_controler,
  });

  final register_controler;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Text(
            "Finish setting up your account",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            "assets/upload_img_tmp.png",
            width: 300,
          ),
          Transform.translate(
            offset: Offset(0, -50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upload image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.upload,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.BlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SettingInputBox(
            hint: "What's your Current Address?",
            on_change : (value) { register_controler.addr_contoler.value = value; print(value); }
          ),
          SettingInputBox(hint: "Phone number", is_number: true,on_change : (value) { register_controler.phone_number_controler.value = value; }),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              register_controler.date_popup(context);
            },
            child: Text("Select date of birth"),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Obx( () =>  GradientButton(
                enabled: register_controler.addr_contoler.value != "" && register_controler.phone_number_controler.value != "",
                  callback: register_controler.finish_profile,
                  widget: Center(
                    child: Text(
                      "Finish Profile!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RegisterFirstInfo extends StatelessWidget {
  const RegisterFirstInfo({
    super.key,
    required this.register_controler,
  });

  final RegisterControler register_controler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text("Hi there,"),
              SizedBox(height: 10),
              Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  register_controler.first_name_controler.value = value;
                },
                decoration: InputDecoration(
                  label: Text("First Name"),
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFFF7F8F8),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  register_controler.last_name_controler.value = value;
                },
                decoration: InputDecoration(
                  label: Text("Last Name"),
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFFF7F8F8),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  register_controler.email_controler.value = value;
                },
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
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  register_controler.password_controler.value = value;
                },
                obscureText: true,
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
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: Checkbox(
                      value: false,
                      onChanged: (val) {
                        register_controler.terms_check_box(val ?? false);
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "By continuing you agree to terms and conditions",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            child: Obx(
              () => GradientButton(
                enabled: register_controler.first_name_controler.value != "" &&
                    register_controler.last_name_controler.value != "" &&
                    register_controler.email_controler.value != "" &&
                    register_controler.password_controler.value != "",
                widget: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                callback: register_controler.register,
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
                  callback: register_controler.register_with_google),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: register_controler.to_login,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFFDF81F5),
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
    );
  }
}
