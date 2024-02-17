import 'package:coscape_mobile/consts/colors.dart';
import 'package:coscape_mobile/consts/routes.dart';
import 'package:coscape_mobile/state/wraper_drawer_controler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WrapedDrawer extends StatelessWidget {
  WrapedDrawer({super.key, required this.widget});
  final Widget widget;

  final tabs = [
    {
      "icon_path": "assets/ri_survey-line.svg",
      // "height": 25,
      "title": "Surveys",
      "path": Routes.surveys_page,
    },
    {
      "icon_path": "assets/Vector (11).svg",
      // "height": 25,
      "title": "Done",
      "path": Routes.done_page,
    },
    {
      "icon_path": "assets/Group.svg",
      // "height": 22,
      "title": "Profile",
      "path": Routes.profile_page,
    },
    {
      "icon_path": "assets/Vector (8).svg",
      // "height": 16,
      "title": "My Money",
      "path": Routes.my_money_page,
    },
    {
      "icon_path": "assets/grommet-icons_transaction.svg",
      // "height": 16,
      "title": "Transaction",
      "path": Routes.transacation_page,
    },
    {
      "icon_path": "assets/Vector (9).svg",
      // "height": 25,
      "title": "Notifications",
      "path": Routes.notification_page,
    },
    {
      "icon_path": "assets/Vector (10).svg",
      // "height": 25Vector (12),
      "title": "Settings",
      "path": Routes.setting_page,
    },
  ];

  var wraper_drawer_controler = Get.put(WraperDrawerControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget,
          Obx(() => wraper_drawer_controler.show_drawer.value
              ? Positioned(
                  child: GestureDetector(
                    onTap: () { wraper_drawer_controler.hide_drawer();  },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                )
              : SizedBox()),
          Obx(() => wraper_drawer_controler.show_drawer.value
              ? Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 90,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 10, right: 20, top: 60, bottom: 10),
                    child: Column(
                      children: [
                        ProfileInfo(),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: tabs
                              .asMap()
                              .map((key, val) {
                                return MapEntry(
                                  key,
                                  SelectableTab(
                                    icon_path: val["icon_path"] as String,
                                    title: val["title"] as String,
                                    selected:
                                        wraper_drawer_controler.selected_tab.value ==
                                            key,
                                    on_click : () { 
                                      wraper_drawer_controler.select_tab(key,val["path"] as String);
                                    } 
                                  ),
                                );
                              })
                              .values
                              .toList(),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SelectableTab(
                              icon_path: "assets/Vector (12).svg",
                              height: 25,
                              title: "Logout",
                              selected: false,
                              on_click: () {
                                Get.toNamed(Routes.login_page);

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox()),
        ],
      ),
    );
  }
}

class SelectableTab extends StatelessWidget {
  SelectableTab({
    super.key,
    required this.title,
    required this.icon_path,
    this.height = 30,
    required this.selected,
    required this.on_click,

  });

  final String title;
  final String icon_path;
  final double height;
  final bool selected;
  final Function on_click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {on_click();},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.BlueColor.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: SvgPicture.asset(
                icon_path,
                color: selected ? AppColors.BlueColor : AppColors.GreyColor,
                height: height,
              ),
            ),
            SizedBox(width: 10),
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 17,
                color: selected ? AppColors.BlueColor : AppColors.TextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/profile_img.png"),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mokrane Smith"),
            Text(
              "Mokranesmith12@gmail.com",
              style: TextStyle(
                color: Color(0xFF71839B),
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
