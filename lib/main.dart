//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidapet_flutter/app/core/push_notification/push_message_configure.dart';
import 'package:flutter/material.dart';
import 'package:cuidapet_flutter/app/app_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await loadEnv();
  PushMessageConfigure().configure();
  
  runApp(ModularApp(module: AppModule()));
  //Firestore.instance.collection('user').document().setData({'name': 'Leo'});
  //print('Done ...');
}

Future<void> loadEnv() async {
  const isProduction = bool.fromEnvironment('dart.vm.product');
  await DotEnv().load(isProduction ? '.env' : '.env_dev');
}
