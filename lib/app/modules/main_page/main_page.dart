//import 'package:cuidapet_flutter/app/modules/home/home_page.dart';
import 'package:cuidapet_flutter/shared/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> setPage() async {
    final authStore = Modular.get<AuthStore>();
    final isLogged = await authStore.isLogged();
    if (isLogged) {
      Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
    } else {
      Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    setPage();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Main Page'),
      // ),
      body: Center(child: Text('Main Page'),),
    );
  }
}

/*
class MainPage extends StatelessWidget {
  MainPage() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
      final authStore = Modular.get<AuthStore>();
      final isLogged = await authStore.isLogged();
      if (isLogged) {
        Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      } else {
        Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
*/

// ---

/*
class MainPagePage extends StatefulWidget {
  final String title;
  const MainPagePage({Key key, this.title = "MainPage"}) : super(key: key);

  @override
  _MainPagePageState createState() => _MainPagePageState();
}

class _MainPagePageState
    extends ModularState<MainPagePage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
*/
