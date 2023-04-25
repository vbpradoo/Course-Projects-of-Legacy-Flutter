import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return  Container(
      padding: EdgeInsets.only(top: 5.0),     
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            peliculas[index].uniqueId = '${ peliculas[index].id }-tarjeta';
            return Hero(
                tag: peliculas[index].uniqueId,
                child: GestureDetector(
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                      image: NetworkImage(peliculas[index].getPosterImg()),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      fit: BoxFit.cover
                    ),
                  ),
                  onTap: (){
                    //print('ID de la pelicula ${ pelicula.id }');
                    Navigator.pushNamed(context, 'detalle',arguments: peliculas[index]);
                  },
                ),
            );
          },

          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),  // Puntitos contador elementos
          // control: new SwiperControl(), // Flechas de direccionalidad
          itemWidth: _screenSize.width * 0.65,
          itemHeight: _screenSize.height * 0.55,
          layout: SwiperLayout.STACK,
        ),
    );
  }
}