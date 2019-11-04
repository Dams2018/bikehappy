import 'package:bikehappy/screens/authenticate/Registro.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:bikehappy/services/auth.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

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
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro()),
                    );
                  },
                  child: Text(
                    "Crear Cuenta",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            body: CustomScrollView(
              //lista scroll
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
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
                                            icon: Icon(Icons.email),
                                            hintText: '',
                                            labelText: 'Correo Electronico',
                                          ),
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          },
                                        ),
                                        SizedBox(height: 20.0),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            icon: Icon(Icons.lock),
                                            hintText: '',
                                            labelText: 'Contraseña',
                                          ),
                                          obscureText: true,
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                        ),

                                        SizedBox(height: 80.0),
                                        Container(
                                          child: ButtonTheme(
                                            minWidth: 400.0,
                                            child: RaisedButton(
                                              color: Colors.blue,
                                              child: Text(
                                                "Iniciar",
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
              ],
            )),
      ],
    );
  }
}
