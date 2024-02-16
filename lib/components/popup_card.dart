
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({
    super.key,
    required this.on_start,
    required this.on_cancel,
  });

  final Function on_start;
  final Function on_cancel;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => on_cancel(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset("assets/Video_player.png"),
                      Positioned(
                        bottom: -55/2,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => on_start(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 2,spreadRadius: 2,offset: Offset(0,2),color: Colors.grey.withOpacity(0.2))
                              ]
                            ),
                            width:  55,
                            height: 55,
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: AppColors.BlueColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Express",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Delivery company",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.TextColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "SwiftTracks ensures speedy and dependable deliveries, leveraging advanced tracking technology. Our dedicated team guarantees a seamless experience, connecting you with your packages effortlessly. Your satisfaction, our priority.",
                          style: TextStyle(
                            color: AppColors.TextColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 16,
                                  color: AppColors.TextGreyColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "100k Views",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.TextGreyColor,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/ph_heart-fill.svg",
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "10k Love",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.TextGreyColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/humbleicons_money.svg",
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "10k Love",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.BlueColor,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () => on_start(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Start Survey",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.BlueColor,
                                    borderRadius:
                                        BorderRadius.circular(5),
                                  ),
                                ),
                              )
                            ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
