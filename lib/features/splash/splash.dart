import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mygellary/core/utils/app_colors.dart';
import 'package:mygellary/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != null) {
      Navigator.pushReplacementNamed(context, Routes.myGellaryScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    }
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImgAssets.homeBg,
                ),
                fit: BoxFit.fitWidth)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                AppStrings.appName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.fontFamily1,
                    fontSize: 35,
                    color: AppColors.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
