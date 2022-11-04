import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygellary/core/utils/app_strings.dart';

import '../../../core/utils/app_colors.dart';

class UploadButton extends StatelessWidget {
  UploadButton(
      {Key? key,
      required this.text,
      required this.btnIcon,
      required this.onPress,
      required this.backGroundColor,
      this.textColor = Colors.white})
      : super(key: key);
  String text;
  String btnIcon;
  Function() onPress;
  Color? textColor;
  Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 7, horizontal: 20)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ))),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            btnIcon,
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(text.toUpperCase(),
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.textColor,
                  fontFamily: AppStrings.fontFamily1,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
