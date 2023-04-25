import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    // print(menuProvider.opciones);

    // menuProvider.cargarData().then( (opciones) {
    //   print( '_lista' );
    //   print(opciones);
    // } );

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],  //Opcional, sale mientras no carga
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){

        // print('builder');
        //print( snapshot.data );

        return ListView(
            children: _listaItems( snapshot.data, context ),
        );
      },
    );
  }

  List<Widget> _listaItems( List<dynamic> data , BuildContext context ){
    
    final List<Widget> opciones = [];

    //if( data == null ) {return null;} // Lo sustituye initaldata
    
    data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon( opt['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          
          Navigator.pushNamed(context, opt['ruta']);

          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );

          // Navigator.push(context, route);

        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }

}