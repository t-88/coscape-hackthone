import 'package:coscape_mobile/components/custom_appbar.dart';
import 'package:coscape_mobile/components/custom_drop_down_menu.dart';
import 'package:coscape_mobile/components/edit_profile_img.dart';
import 'package:coscape_mobile/components/input_box_with_dropdown_menu.dart';
import 'package:coscape_mobile/components/notification_card.dart';
import 'package:coscape_mobile/components/setting_input_box.dart';
import 'package:coscape_mobile/components/text_and_filter.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: Row(
              children: [
                SvgPicture.asset(
                  "assets/Vector (10).svg",
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextAndFilter(
                    text: "Edit Profile",
                    show_price: false,
                    show_date: false,
                  ),
                  EditProfileImg(),
                  SizedBox(height: 20),
                  SettingInputBox(
                    hint: "What's your first name?",
                  ),
                  SettingInputBox(
                    hint: "What's your Last name?",
                  ),
                  SettingInputBox(
                    hint: "What's your Current Address?",
                  ),
                  SettingInputBox(hint: "Phone number", is_number: true),
                  InputboxWithDropdownMenu(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    decoration: BoxDecoration(
                        color: AppColors.BlueColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
