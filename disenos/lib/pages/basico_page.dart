import 'package:flutter/material.dart';


class BasicoPage extends StatelessWidget {

  final estiloTitulo    = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            
          ],
        ),
        
      ),
    );
  }

  Widget _crearImagen(){
    return  Image(image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&w=1000&q=80'));
  }

  Widget _crearTitulo(){
    return  Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Paisaje de Montaña', style: estiloTitulo),
                      SizedBox(height: 7.0),
                      Text('Un rio precioso en Argentina.', style: estiloSubtitulo, 
                      overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.red, size: 30.0),
                Text('41', style: TextStyle(fontSize: 20.0)),
              ],
            ),
          );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearAccion(Icons.call, 'Call'),
        _crearAccion(Icons.near_me, 'Route'),
        _crearAccion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String texto) {

    return Column(
          children: <Widget>[
            Icon(icon, color: Colors.blue, size: 40.0),
            SizedBox(height: 5.0),
            Text(texto.toUpperCase(), style: TextStyle(fontSize: 15.0, color: Colors.blue)),
          ],
        );
  }

  Widget _crearTexto() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
      child: Text(
        'Incididunt mollit ad proident sint in cupidatat irure voluptate irure adipisicing qui id do ad. Labore consectetur non dolore proident aliqua enim aute ut ea. Cillum ex fugiat nostrud laboris tempor magna elit quis tempor ad mollit cupidatat id est. Aliqua veniam dolor commodo magna do nisi esse veniam sit id dolore Lorem. Magna magna voluptate voluptate aute eiusmod aliquip et enim.',
        textAlign: TextAlign.justify
      ),
    );
  }



}