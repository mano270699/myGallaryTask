import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygellary/core/utils/app_strings.dart';

import '../../../core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.backGroundColor,
      this.textColor = Colors.white})
      : super(key: key);
  String text;
  Function() onPress;
  Color? textColor;
  Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 10)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ))),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text.toUpperCase(),
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: AppStrings.fontFamily2,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
    );
  }
}
