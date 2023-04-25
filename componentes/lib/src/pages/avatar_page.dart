import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ], 
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTxXXaeCwWFZwDGozQQAQMkDh5RtKh4CgS4ViM403f3LUtbRx-W&usqp=CAU'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 200),
        ),
      ),
    );
  }
}