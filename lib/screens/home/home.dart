import 'package:bikehappy/screens/home/Lugares.dart';
import 'package:bikehappy/screens/home/maps.dart';
import 'package:bikehappy/screens/home/user.dart';
import 'package:flutter/material.dart';
import 'package:bikehappy/services/auth.dart';
import 'package:bikehappy/screens/home/modal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatelessWidget {
  Modal modal = new Modal();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height

          child: AppBar(
              backgroundColor: Color(0xFF34495E),
              brightness: Brightness.dark,
              elevation: 0.0,
              title: Text('Marco Astorga',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                  )),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => User()),
                            );
                          },
                          padding: EdgeInsets.all(0.0),
                          child: CircleImage()),
                    ),
                    // action button
                  ],
                ),
              ]
              // ...
              )),
      body: MyHomePage(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 80.0,
          color: Colors.transparent,
          child: Center(
            child: Text(
              arriendos[0].shopName,
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => modal.mainBottomSheet(context),
        child: Icon(
          Icons.directions_bike,
          color: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

//imagen en una clase
class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 50.0;

    return Center(
      child: new Container(
          width: _size,
          height: _size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage("assets/Oval.png")))),
    );
  }
}

class CirclePeso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 50.0;

    return Center(
      child: new Container(
          width: _size,
          height: _size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage("assets/dolar.png")))),
    );
  }
}
