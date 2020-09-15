import 'package:cuidapet_flutter/app/modules/login/login_module.dart';
import 'package:cuidapet_flutter/app/modules/main_page/main_page.dart';
import 'package:cuidapet_flutter/app/repository/usuario_repository.dart';
import 'package:cuidapet_flutter/app/services/usuario_services.dart';
import 'package:cuidapet_flutter/shared/auth_store.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:cuidapet_flutter/app/app_widget.dart';
import 'package:cuidapet_flutter/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthStore()),
        Bind((i) => UsuarioRepository()),
        Bind((i) => UsuarioService(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (context, args) => MainPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
