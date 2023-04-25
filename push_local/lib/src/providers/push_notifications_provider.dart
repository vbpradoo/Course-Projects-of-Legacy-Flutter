import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){

      print('========== FCM Token ============');
      print( token );

      // cGFFlLa2Jk4:APA91bH7N4miq4M8-OAkuRcI6UOFmoHfmMF0l3nNWYqJTQAgI4wQTxhfMWGCDWevBPNj0SUfvue-OtSoWKIihylQsk9UwLiMWjXGQUT-3QgBIligCDegOJlTMg3VJ0UyDTsF-0gAs2Qk
      // eExgcJ1ffSQ:APA91bGu4nqG8aVmdACQjneg1G1BcniIk-q0D-ZJEb2OWbdV939LzvZE5-_LfLGRNu0bhvOn4dhhG-RnrTGUhY5wm876-Ck-lM1MkmH-tsR-z96zy9nKh4a4-a8VmbuSChciGrud-Ft8
      //print("EOHHHH");
    });
  
    _firebaseMessaging.configure(


      onMessage: ( info ) async {
        print('====== On Message ======');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid){
          argumento = info['data']['datos'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onLaunch: ( info ) async {
        print('====== On Resume ======');
        print(info);
        
       
      },
 
      onResume: ( info ) async {
        print('====== On Resume ======');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid){
          argumento = info['data']['datos'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      }    
    );

  }

  dispose() {
    _mensajesStreamController?.close();
  }



}