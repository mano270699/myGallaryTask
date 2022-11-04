import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygellary/core/utils/constants.dart';
import 'package:mygellary/data/Api/api.dart';
import 'package:mygellary/data/repositories/gellary_reposatory.dart';
import 'package:mygellary/features/mygellary/cubit/cubit/gellary_cubit.dart';
import 'package:mygellary/features/mygellary/widgets/btn_upload.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';

class GlassDialog extends StatefulWidget {
  GlassDialog({
    Key? key,
  }) : super(key: key);

  @override
  _GlassDialogState createState() => _GlassDialogState();
}

class _GlassDialogState extends State<GlassDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: AppColors.whiteColor.withOpacity(0.7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(width: 0.5, color: AppColors.textColor)),
        content: BlocProvider(
          create: (context) => GellaryCubit(GellaryRepository(AppApi())),
          child: BlocConsumer<GellaryCubit, GellaryState>(
            listener: (context, state) {
              if (state is GellaryUpLoaded) {
                Navigator.pushReplacementNamed(context, Routes.myGellaryScreen);
                Constants.showToast(msg: "Image Uploaded");
              }
              if (state is GellaryPickedFromGellary) {
                GellaryCubit.get(context)
                    .upload(image: GellaryCubit.get(context).file);
              }
            },
            builder: (context, state) {
              var cubit = GellaryCubit.get(context);
              return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: 250.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: UploadButton(
                            backGroundColor: AppColors.uploadfromImagebtnColor,
                            onPress: () {
                              cubit.choosePhoto();
                            },
                            btnIcon: ImgAssets.fromGellary,
                            text: "Gellary",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: UploadButton(
                            backGroundColor: AppColors.uploadFromCameraBtnColor,
                            onPress: () {
                              cubit.choosePhotofromCamera();
                            },
                            btnIcon: ImgAssets.fromCamera,
                            text: "Camera",
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ));
  }
}
