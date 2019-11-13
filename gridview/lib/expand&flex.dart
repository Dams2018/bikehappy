import 'package:flutter/material.dart';
import 'package:gridview/ios.dart';

class Expand extends StatefulWidget {
  @override
  _ExpandState createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("expand&flex"),
          ),
          body: Column(
            children: <Widget>[
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 200,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
              //saltar linea de abajo dentro de lamisma columna una nueva fila
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      color: Colors.brown,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child:           Container(
                      height: 100,
                      color: Colors.blue,
                      child: FlatButton(
                        color: Colors.grey,
                        child: Text("IOS"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IosVentana()),
                          );
                        },
                      ),
                    )
                  )
                ],
              )

            ],
          ),
        )
      ],
    );
  }
}
