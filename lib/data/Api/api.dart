import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mygellary/core/utils/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/app_strings.dart';

class AppApi {
  Dio? dio;
  AppApi() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20second ,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      Response response = await dio!
          .post(EndPoints.login, data: {"email": email, "password": password});
      print(response.data.toString());
      print(response.statusCode.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> getMyGellary() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      dio!.options.headers = {
        'Authorization': "Bearer $token",
      };
      Response response = await dio!.get(
        EndPoints.myGellary,
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> upload({
    required File image,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      dio!.options.headers = {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Future<String> uploadImage(File file) async {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(
          image.path,
        ),
      });
      // response = await dio.post("/info", data: formData);
      // return response.data['id'];
//}
      Response response =
          await dio!.post(EndPoints.uploadGellary, data: formData);
      print(response.data.toString());
      print(response.statusCode.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
