
import 'package:coscape_mobile/state/survey_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        color: Color(0xFF5d5fef),
      ),
      child: Padding(
        padding: EdgeInsets.only(top:  30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {print("asdasdas"); },
                  child: SvgPicture.asset(
                    "assets/mingcute_menu-fill.svg",
                    width: 25,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                title,
               
              ],
            ),
            SvgPicture.asset(
              "assets/Huge-icon.svg",
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
