import 'package:bikehappy/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//stfu

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              elevation: 0.0,
              actions: <Widget>[
                FlatButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro()),
                    );
                  },
                ),
              ],
            ),
            body: CustomScrollView(
              //lista scroll
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Center(
                      child: Container(
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/logo.png',
                                      width: 150,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Bienvenido a BikeHappy",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Nombre',
                                            ),
                                            onChanged: (val) {
                                              setState(() => nombre = val);
                                            },
                                          ),
                                          SizedBox(height: 10.0),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Apellidos',
                                            ),
                                            onChanged: (val) {
                                              setState(() => apellidos = val);
                                            },
                                          ),
                                          SizedBox(height: 10.0),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Run',
                                            ),
                                            onChanged: (val) {
                                              setState(() => run = val);
                                            },
                                          ),
                                          SizedBox(height: 10.0),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Correo Electronico',
                                            ),
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            },
                                          ),
                                          SizedBox(height: 10.0),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Contraseña',
                                            ),
                                            obscureText: true,
                                            onChanged: (val) {
                                              setState(() => password = val);
                                            },
                                          ),
                                          SizedBox(height: 40.0),
                                          Container(
                                            child: ButtonTheme(
                                              minWidth: 400.0,
                                              child: RaisedButton(
                                                color: Colors.blue,
                                                child: Text(
                                                  "Registar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home()),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
