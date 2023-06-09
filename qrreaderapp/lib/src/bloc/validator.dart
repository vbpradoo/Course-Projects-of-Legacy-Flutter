import 'dart:async';

import 'package:qrreaderapp/src/models/scan_model.dart';

class Validators {

  final validarGeo =  new StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (scans, sink){
      final geoScans = scans.where((s) => s.type == 'geo').toList();
      sink.add(geoScans);
    }
  );

  final validarHttp =  new StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (scans, sink){
      final httpScans = scans.where((s) => s.type == 'http').toList();
      sink.add(httpScans);
    }
  );

}