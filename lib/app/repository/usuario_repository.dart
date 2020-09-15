import 'dart:io';

import 'package:cuidapet_flutter/app/core/dio/custom_dio.dart';
import 'package:cuidapet_flutter/app/models/access_token_model.dart';
import 'package:cuidapet_flutter/app/models/confirm_login_model.dart';
import 'package:cuidapet_flutter/app/repository/shared_prefs_repository.dart';
//import 'package:flutter/services.dart';

class UsuarioRepository {
  // Fluxo: View -> controller -> services -> repository
  Future<AccessTokenModel> login(String email, {String senha, bool facebookLogin = false, String avatar = ''}) {
    return CustomDio.instance.post('/login', data: {
      'login': email,
      'senha': senha,
      'facebookLogin': facebookLogin,
      'avatar': avatar,
    }).then((res) => AccessTokenModel.fromJson(res.data));
  }

  Future<ConfirmLoginModel> confirmLogin() async {
    final prefs = await SharedPrefsRepository.instance;
    final deviceId = prefs.deviceId;

    return CustomDio.authInstance.patch('/login/confirmar', data: {
      'ios_token': Platform.isIOS ? deviceId : null,
      'android_token': Platform.isAndroid ? deviceId : null,
    }).then((res) => ConfirmLoginModel.fromJson(res.data));
  }
}
