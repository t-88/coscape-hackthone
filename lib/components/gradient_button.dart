
import 'package:coscape_mobile/consts/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Function callback;
  final Widget widget;
  GradientButton({
    super.key,
    required this.callback,
    required this.widget,
    this.enabled = true,
  });

  bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { if(enabled) { callback(); } },
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Container(
            child: widget,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: enabled ? [
                  AppColors.BlueColor,
                  Color(0xFF9F4CDD),
                ] : [Colors.grey,Colors.black.withOpacity(0.5)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
