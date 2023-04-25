import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/home_page.dart';
import 'package:qrreaderapp/src/pages/mapa_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());
 
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // REMOVES TRANSPARENT TOP
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      title: 'QRReader App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'  : (BuildContext context) => HomePage(),
        'mapa'  : (BuildContext context) => MapaPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}