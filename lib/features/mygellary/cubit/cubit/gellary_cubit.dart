import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mygellary/data/models/gellary_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repositories/gellary_reposatory.dart';

part 'gellary_state.dart';

class GellaryCubit extends Cubit<GellaryState> {
  GellaryCubit(this._gellaryRepository) : super(GellaryInitial());
  static GellaryCubit get(context) => BlocProvider.of(context);

  final GellaryRepository _gellaryRepository;
  GellaryModel? gellaryModel;
  String? userName;
  getAllMyGallery() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name');
    emit(GellaryLoading());
    _gellaryRepository.getAllMyGellary().then((value) async {
      gellaryModel = value;
      emit(GellaryLoaded());
    }).catchError((err) {
      print("error: $err");
      emit(GellaryFailed());
    });
  }

  upload({required File image}) async {
    emit(UploadGellaryLoading());
    _gellaryRepository.uploadGellary(image: image).then((value) async {
      // gellaryModel = value;
      emit(GellaryUpLoaded());
    }).catchError((err) {
      print("error: $err");
      emit(GellaryUploadFailed());
    });
  }

  File? _file;
  PickedFile? _data;

  PickedFile get data => _data!;

  File get file => _file!;
  final picker = ImagePicker();

  void choosePhoto() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    if (pickedFile != null) {
      _file = File(pickedFile.path);
      emit(GellaryPickedFromGellary());
    } else {
      print('No image selected.');
    }
  }

  void choosePhotofromCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    if (pickedFile != null) {
      _file = File(pickedFile.path);
      emit(GellaryPickedFromGellary());
    } else {
      print('No image selected.');
    }
  }

  // void pickImage() async {
  //   _data = await picker.pickImage(
  //       source: ImageSource.gallery,
  //       maxHeight: 100,
  //       maxWidth: 100,
  //       imageQuality: 20);
  // }
}
