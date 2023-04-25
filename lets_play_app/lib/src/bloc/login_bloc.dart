import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:lets_play_app/src/bloc/validators.dart';



class LoginBloc with Validators{

  final _emailController    =  BehaviorSubject<String>(); 
  final _passwordController =  BehaviorSubject<String>();

  // LoginBloc() {}

  //Recuperar los datos del stream
  Stream<String> get emailStream     => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream  => _passwordController.stream.transform(validarPassword);

  Stream<bool>   get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al String 
 Function(String) get changeEmail => _emailController.sink.add;
 Function(String) get changePassword => _passwordController.sink.add;

//Obtener último valor ingresado a los streams
String get email => _emailController.value;
String get pasword => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}