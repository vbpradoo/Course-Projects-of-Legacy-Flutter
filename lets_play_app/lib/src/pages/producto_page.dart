import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lets_play_app/src/bloc/provider.dart';
import 'package:lets_play_app/src/models/producto_model.dart';

import 'package:lets_play_app/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductosBloc productosBloc;
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File foto;
   
  @override
  Widget build(BuildContext context) {

    productosBloc = Provider.productosBloc(context);

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if( prodData != null ){
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if( value.length < 3 ){
          return 'Ingrese el precio del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
   return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
      labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if( utils.isNumeric(value) ){
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible, 
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState((){
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      icon: Icon(Icons.save), 
      label: Text('Guardar'),
      onPressed: (_guardando) ? null : _submit, 
    );
  }

  void _submit() async {

    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();
    // print('Todo OK!');

    // print(producto.titulo);
    // print(producto.valor);
    // print(producto.disponible);
    setState(() {
      _guardando = true;
    });

    if( foto!=null ){
      producto.fotoUrl = await productosBloc.subirFoto(foto);
    }

    if( producto.id == null){
      productosBloc.agregarProducto(producto);
      mostrarSnackbar('Registro guardado'); 
    } else{
      productosBloc.editarProducto(producto);
      mostrarSnackbar('Registro actualizado'); 
    }
    // setState(() {
    //   _guardando = false;
    // });
    Navigator.pop(context);
  }

  void mostrarSnackbar( String mensaje ){

    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  } 

  Widget _mostrarFoto(){
    
    if(producto.fotoUrl != null){
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(producto.fotoUrl),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      return Image(
        image: AssetImage( foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen)async {

    foto = await ImagePicker.pickImage(
      source: origen
    );

    if(foto != null){
      producto.fotoUrl = null;
    }

    setState(() {});
  }
}