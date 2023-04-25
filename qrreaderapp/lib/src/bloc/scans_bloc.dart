import 'dart:async';

import 'package:qrreaderapp/src/providers/db_provider.dart';
import 'package:qrreaderapp/src/bloc/validator.dart';


class ScansBloc with Validators{
  
  static final ScansBloc _singleton = new ScansBloc._();

  factory ScansBloc() {
    return  _singleton;
  } 

  ScansBloc._(){
    //Obtener Scans de la Base de datos
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }


  obtenerScans() async {
    _scansController.sink.add( await DBProvider.db.getTodosScans());
  }  

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan( int id ) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTODOS() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}

