import 'package:flutter/material.dart';
import 'package:lets_play_app/src/bloc/provider.dart';
import 'package:lets_play_app/src/pages/home_page.dart';
import 'package:lets_play_app/src/pages/login_page.dart';
import 'package:flutter/services.dart';
import 'package:lets_play_app/src/pages/producto_page.dart';
import 'package:lets_play_app/src/pages/registro_page.dart';
import 'package:lets_play_app/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

   runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LetsPlay App',
        initialRoute: 'login',
        routes: {
          'login'       : (BuildContext context) => LoginPage(),
          'registro'       : (BuildContext context) => RegistroPage(),
          'home'        : (BuildContext context) => HomePage(),
          'producto'    : (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );

  }
}