import 'dart:convert';

import 'package:lets_play_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {

  //final String _djangoToken = 'AIzaSyA5nNmAtujOWLoRs0npepsi-Axv0safLvg';
  final _prefs = new PreferenciasUsuario();

  Future<Map <String, dynamic>> login(String email, String password) async {

    // TODO : name must be email due to backend error but username needed
    final authData ={
          'username'          : email,
          'password'          : password
          //'returnSecureToken' : true,
        };

    //final _localUri =  Uri.parse('http://192.168.0.23:8000/api/account/login');
    final _localUri = new Uri.http("127.0.0.1:8000", "/api/account/login");
    final _localUrl = 'http://192.168.0.23/api/account/login';
    print(_localUri.toString());

    final resp = await http.post(
      _localUri,
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if(decodedResp.containsKey('token')){

      _prefs.token = decodedResp['token'];
      
      return {'ok': true, 'token': decodedResp['token']};
    } else {

      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }

  }


  Future<Map <String, dynamic>> nuevoUsuario(String email, String password) async {

    //TODO: Add username to form
    final authData ={
      'email'             : email,
      'username'          : email,
      'password'          : password,
      'password2'         : password
    };

    final resp = await http.post(
      'http://192.168.0.23:8000/api/account/register',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if(decodedResp.containsKey('token')){
      //TODO: Guardar el Token en el storage
      return {'ok': true, 'token': decodedResp['token']};
    } else {

      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }

  }

}