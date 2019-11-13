import 'package:flutter/material.dart';
import 'package:flutter_qrscaner/flutter_qrscaner.dart';

class MyQR extends StatefulWidget {
  @override
  _MyQRState createState() => _MyQRState();
}

class _MyQRState extends State<MyQR> {
  String _qrContent = "xxxxxxxxxxxx";
  String  _activo = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
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
                title: Text('B0000001',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    )),
                actions: <Widget>[]
                // ...
                ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),

                FlatButton(
                  onPressed: () {
                    FlutterQrscaner.startScan().then((value) {
                      setState(() {
                        _qrContent = value;
                        _activo="Activo";
                      });
                    });
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[Icon(Icons.camera,size: 100, color: Colors.blue,), Text("Scan")],
                  ),
                ),
                Spacer(),
                Text('Nº Bicicleta：$_qrContent'),
                Text('$_activo'),
                Spacer()
              ],
            ),
          ),
        )
      ],
    );


  }




}
