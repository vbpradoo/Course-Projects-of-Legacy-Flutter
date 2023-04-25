import 'package:flutter/material.dart';
import 'package:disenos/pages/basico_page.dart';
import 'package:disenos/pages/scroll_page.dart';
import 'package:disenos/pages/botones_page.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //CAMBIA EL COLOR DEL STATUS BAR SUPERIOR
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //  statusBarColor: Colors.white, 
    // ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      initialRoute: 'botones',
      routes: {
        'basico'  : (BuildContext context) => BasicoPage(),
        'scroll'  : (BuildContext context) => ScrollPage(),
        'botones'  : (BuildContext context) => BotonesPage(),
      },
    );
  }
}