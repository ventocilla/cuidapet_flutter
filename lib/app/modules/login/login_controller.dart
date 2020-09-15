import 'package:cuidapet_flutter/app/services/usuario_services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UsuarioService _service;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @observable
  bool obscureText = false;

  _LoginControllerBase(this._service);

  @action
  void mostrarSenhaUsuario() {
    obscureText = !obscureText;
  }

  @action
  Future<void> login() async {
    if (formkey.currentState.validate()) {
      try {
        await _service.login(loginController.text, senha: senhaController.text);
        Modular.to.pushReplacementNamed('/');
      } catch (e) {
        print(e);
        Get.snackbar('Erro', 'Erro ao realizar login');
      }
    }
  }
}
