
import 'package:coscape_mobile/components/custom_button_icon.dart';
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingRow extends StatelessWidget {
  RatingRow({
    super.key,
    required this.cur_rating,
    required this.on_select_rating,
  });

  final int cur_rating;
  final Function on_select_rating;
  final svgs = [
    "assets/face0.svg",
    "assets/face1.svg",
    "assets/face2.svg",
    "assets/face3.svg",
    "assets/face4.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...svgs
            .asMap()
            .map((key, val) {
              return MapEntry(
                  key,
                  CustomButtonIcon(
                    on_click: () {on_select_rating(key);},
                    icon: SvgPicture.asset(
                      val,
                      color: cur_rating == key
                          ? Colors.white
                          : AppColors.BlueColor,
                    ),
                    selected: cur_rating == key,
                  ));
            })
            .values
            .toList(),
      ],
    );
  }
}
