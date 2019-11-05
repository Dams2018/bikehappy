import 'package:bikehappy/screens/authenticate/sign_in.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//stfu

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
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
                backgroundColor: Colors.transparent,
                brightness: Brightness.dark,
                elevation: 0.0,
                centerTitle: true,
                title: Text('Marco Astorga',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    )),
                actions: <Widget>[]
                // ...
                ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Imagen()
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
                                        Text('marcoastorga.g@gmail.com',
                                            style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(height: 10.0),
                                        Text('',
                                            style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Contraseña Anterior',
                                          ),
                                          obscureText: true,
                                          onChanged: (val) {
                                            setState(() => val = val);
                                          },
                                        ),
                                        SizedBox(height: 40.0),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Nueva Contraseña',
                                          ),
                                          obscureText: true,
                                          onChanged: (val) {
                                            setState(() => val = val);
                                          },
                                        ),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Repetir Nueva Contraseña',
                                          ),
                                          obscureText: true,
                                          onChanged: (val) {
                                            setState(() => val = val);
                                          },
                                        ),
                                        SizedBox(height: 10.0),
                                        Container(
                                          child: ButtonTheme(
                                            minWidth: 400.0,
                                            child: RaisedButton(
                                              color: Colors.blue,
                                              child: Text(
                                                "Cambiar Contraseña ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignIn()),
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
          ),
          //barra navegadora inferior
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50.0,
              color: Colors.blue[300],
              child: Center(child: Text('© 2019 Copyright: HappyGroup')),
            ),
          ),
          //boton
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {}),
            tooltip: 'Ayuda',
            child: Icon(
              Icons.headset_mic,
              size: 30,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ),
      ],
    );
  }
}

class Imagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 100.0;

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
