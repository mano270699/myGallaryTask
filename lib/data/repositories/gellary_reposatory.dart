import 'dart:io';

import 'package:mygellary/data/models/gellary_model.dart';
import 'package:mygellary/data/models/user_model.dart';

import '../Api/api.dart';

class GellaryRepository {
  final AppApi _appApi;

  GellaryRepository(this._appApi);
  Future<GellaryModel> getAllMyGellary() async {
    final myGellary = await _appApi.getMyGellary();
    return GellaryModel.fromJson(myGellary);
  }

  Future<void> uploadGellary({required File image}) async {
    final myImage = await _appApi.upload(image: image);
    //return myImage;
  }
}
