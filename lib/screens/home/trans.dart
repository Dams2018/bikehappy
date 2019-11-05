import 'package:flutter/material.dart';

class Trans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network('https://lh5.googleusercontent.com/p/AF1QipMvtEO1zb4R3rFUypzSbKrrTvCJlo_ao8sNRkR-=w408-h240-k-no-pi-10-ya9.999999-ro-0-fo100',
                    fit: BoxFit.cover, height: 160.0,width: 160.0),
                Text('\$549',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0
                  ),
                ),new Text("Duoc UC: Sede Plaza Norte")
              ],
            ),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network('https://upload.wikimedia.org/wikipedia/commons/9/99/Mall_Plaza_Norte_Exterior.jpg', fit: BoxFit.cover, height: 160.0,width: 160.0),
                Text('\$700',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0
                  ),
                ),new Text("Mallplaza Norte")
              ],
            ),
          ],
        ),
      ],
    );
  }
}