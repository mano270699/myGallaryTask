import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygellary/data/repositories/auth_reposatory.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final AuthRepository authRepository;
  login({
    required String email,
    required String password,
  }) {
    emit(Loginloading());
    authRepository.login(email: email, password: password).then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', value.user!.name!);
      prefs.setString('token', value.token!);
      emit(LoginSuccessfully());
    }).catchError((err) {
      print("error: $err");
      emit(LoginFailed());
    });
  }
}
