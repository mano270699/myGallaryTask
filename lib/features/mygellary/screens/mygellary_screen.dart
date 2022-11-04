import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygellary/core/utils/app_colors.dart';
import 'package:mygellary/core/utils/app_strings.dart';
import 'package:mygellary/features/mygellary/cubit/cubit/gellary_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/clipping.dart';

import '../widgets/btn_upload.dart';
import '../widgets/glass_dialog.dart';
import '../widgets/image_item.dart';

class MyGellaryScreen extends StatelessWidget {
  const MyGellaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white.withOpacity(0.4),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImgAssets.homeBg,
                  ),
                  fit: BoxFit.fitWidth)),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: BlocConsumer<GellaryCubit, GellaryState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = GellaryCubit.get(context);
                      return cubit.gellaryModel != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      "welcome",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontFamily: AppStrings.fontFamily1,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      cubit.userName!,
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontFamily: AppStrings.fontFamily1,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      UploadButton(
                                        backGroundColor: AppColors.whiteColor,
                                        onPress: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.remove("token");
                                          prefs.remove("name");
                                          Navigator.pushReplacementNamed(
                                              context, Routes.loginScreen);
                                        },
                                        btnIcon: ImgAssets.logout,
                                        text: "Logout",
                                      ),
                                      UploadButton(
                                        backGroundColor: AppColors.whiteColor,
                                        onPress: () {
                                          showDialog(
                                            barrierColor: Colors.black26,
                                            barrierDismissible: true,
                                            context: context,
                                            builder: (context) {
                                              return GlassDialog();
                                            },
                                          );
                                        },
                                        btnIcon: ImgAssets.upload,
                                        text: "upload",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: (1 / 1),
                                        ),
                                        itemCount: cubit
                                            .gellaryModel!.data!.images!.length,
                                        // shrinkWrap: true,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ImageItem(
                                            image: cubit.gellaryModel!.data!
                                                .images![index],
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ])
                          : Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.uploadfromImagebtnColor),
                            );
                    },
                  ),
                ),
              ),
              ClipPath(
                clipper: Clipping(),
                child: Container(
                  color: AppColors.bgColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30)
                        .r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35.r,
                          backgroundImage: const AssetImage(ImgAssets.user),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
