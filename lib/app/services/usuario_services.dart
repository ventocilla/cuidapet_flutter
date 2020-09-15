import 'package:cuidapet_flutter/app/repository/security_storage_repository.dart';
import 'package:cuidapet_flutter/app/repository/shared_prefs_repository.dart';
import 'package:cuidapet_flutter/app/repository/usuario_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UsuarioService {
  // Fluxo: View -> controller -> services -> repository
  final UsuarioRepository _repository;
  UsuarioService(this._repository);
  Future<void> login(String email, {String senha, bool facebookLogin = false, String avatar = ''}) async {
    try {
      final accessTokenModel = await _repository.login(email, senha: senha, facebookLogin: facebookLogin, avatar: avatar);
      final prefs = await SharedPrefsRepository.instance;
      if (!facebookLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
        prefs.registerAcessToken(accessTokenModel.accessToken);
      } else {
        //
      }
      final confirmModel = await _repository.confirmLogin();
      prefs.registerAcessToken(confirmModel.accessToken);
      SecurityStorageRepository().registerRefreshToken(confirmModel.refreshToken);
    } on PlatformException catch (e) {
      print('Erro ao fazer login no Firebase ....$e');
      rethrow;
    } on DioError catch (e) {
      print('DIOERROR: $e');
      if (e.response.statusCode == 403) {
        print(e.response.data);
      } else {
        rethrow;
      }
    } catch (e) {
      print('Erro ao fazer login ...$e');
      rethrow;
    }
  }
}
