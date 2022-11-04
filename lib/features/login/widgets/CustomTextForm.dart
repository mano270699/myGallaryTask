import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygellary/core/utils/app_strings.dart';
import 'package:mygellary/core/utils/hex_color.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {Key? key,
      this.onChange,
      this.validate,
      this.lable,
      required this.controller,
      this.type,
      this.onTap,
      this.onSubmit,
      required this.hint,
      this.isPassword = false})
      : super(key: key);

  TextEditingController? controller;

  TextInputType? type;
  String? lable;
  String hint;
  bool isPassword = false;

  Function()? onTap;
  Function()? onChange;

  FormFieldValidator? validate;
  ValueChanged? onSubmit;
  Function(String? value)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      controller: controller,
      validator: validate,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10.0, 7.0, 3.0, 7.0),
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: HexColor("#988F8C"),
          fontFamily: AppStrings.fontFamily2,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        // suffixIcon: IconButton(
        //   onPressed: suffixOnPressed,
        //   icon: Icon(
        //     suffixicon,
        //     color: suffexIconColor,
        //   ),
        // ),
      ),
      onTap: onTap,
    );
  }
}
