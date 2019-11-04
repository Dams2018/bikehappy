import 'package:bikehappy/screens/home/home.dart';
import 'package:bikehappy/screens/home/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//stfu

class Dinero extends StatefulWidget {
  @override
  _DineroState createState() => _DineroState();
}

class _DineroState extends State<Dinero> {
  String nombre = '';
  String apellidos = '';
  String run = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    //color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ));

    return Stack(
      // <-- STACK AS THE SCAFFOLD PARENT
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
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
                  ),
            ),
            body: CustomScrollView(
              //lista scroll
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.album),
                            title: Text('The Enchanted Nightingale'),
                            subtitle: Text(
                                'Music by Julie Gable. Lyrics by Sidney Stein.'),
                          ),
                          ButtonTheme.bar(
                            // make buttons use the appropriate styles for cards
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: const Text('BUY TICKETS'),
                                  onPressed: () {/* ... */},
                                ),
                                FlatButton(
                                  child: const Text('LISTEN'),
                                  onPressed: () {/* ... */},
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
