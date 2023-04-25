import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
        itemBuilder: ( context, i ){
          return _tarjeta(context, peliculas[i]);
        },
        itemCount: peliculas.length,
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula){

    pelicula.uniqueId = '${ pelicula.id }-poster';

    final tarjeta = Container(
        margin: EdgeInsets.only(right: 15.00),
        child: Column(
          children: <Widget>[
            Hero(
                tag: pelicula.uniqueId,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  height: 140.0,
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
            //SizedBox(height: 20.0),
          ],
        ),
      );

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        print('ID de la pelicula ${ pelicula.id }');
        Navigator.pushNamed(context, 'detalle',arguments: pelicula);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.00),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                height: 140.0,
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
            //SizedBox(height: 20.0),
          ],
        ),
      );
    }).toList();
  }
}
