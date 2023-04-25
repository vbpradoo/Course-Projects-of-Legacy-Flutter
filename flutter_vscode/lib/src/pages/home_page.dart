import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final estiloTexto = new TextStyle( fontSize: 30 );
  final contador = 10;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks:', style: estiloTexto),
            Text( '$contador' , style: estiloTexto)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
            print('Hola Mundo!!');
            
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}