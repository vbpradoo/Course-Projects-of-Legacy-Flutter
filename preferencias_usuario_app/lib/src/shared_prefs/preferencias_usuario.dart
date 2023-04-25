import 'package:shared_preferences/shared_preferences.dart';


class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._();

  factory PreferenciasUsuario () {
    return _instancia;
  }
  
  
  PreferenciasUsuario._(){}
  
  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // Ninguna de estas propiedades se usa
  bool   _colorSecundario;
  int    _genero;
  String _nombre;

  // GET y SET del genero

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  // GET y SET del _colorSecundario

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // GET y SET del _nombre

  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  // GET y SET de la última página

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  } 

}