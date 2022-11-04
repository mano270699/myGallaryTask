import 'package:mygellary/data/models/user_model.dart';

import '../Api/api.dart';

class AuthRepository {
  final AppApi _appApi;

  AuthRepository(this._appApi);
  Future<UserModel> login(
      {required String email, required String password}) async {
    final login = await _appApi.login(email: email, password: password);
    return UserModel.fromJson(login);
  }
}
