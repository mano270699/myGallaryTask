import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mygellary/core/utils/app_strings.dart';
import 'package:mygellary/features/login/cubit/cubit/login_cubit.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constants.dart';
import '../widgets/CustomTextForm.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImgAssets.loginBg,
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                      ),
                      Text(
                        'My \nGellery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: AppStrings.fontFamily2,
                            fontSize: 40,
                            color: AppColors.textColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.49,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: 380,
                          height: 350,
                          color: Colors.white.withOpacity(0.4),
                          child: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessfully) {
                                Constants.showToast(
                                    msg: "Logged Successfully",
                                    color: Colors.green.shade200,
                                    gravity: ToastGravity.TOP_RIGHT);
                                Navigator.pushReplacementNamed(
                                    context, Routes.myGellaryScreen);
                              }
                              if (state is LoginFailed) {
                                Constants.showToast(
                                    msg: "Login Failed",
                                    color: Colors.red.shade400,
                                    gravity: ToastGravity.TOP_RIGHT);
                              }
                            },
                            builder: (context, state) {
                              var cubit = LoginCubit.get(context);
                              return Form(
                                key: formkey,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'Log in'.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: AppStrings.fontFamily2,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textColor),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: CustomTextForm(
                                        controller: email,
                                        hint: 'Email',
                                        type: TextInputType.emailAddress,
                                        isPassword: false,
                                        validate: ((value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        }),
                                        //  prefixIcon: Icons.email,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: CustomTextForm(
                                        controller: password,
                                        hint: 'Password',
                                        type: TextInputType.text,
                                        isPassword: true,
                                        validate: ((value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        }),
                                        //  prefixIcon: Icons.email,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: AppButton(
                                        onPress: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            cubit.login(
                                                email: email.text,
                                                password: password.text);
                                          }
                                        },
                                        backGroundColor: AppColors.btnColor,
                                        text: "Submit",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
