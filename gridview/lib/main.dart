import 'package:flutter/material.dart';
import 'package:gridview/expand&flex.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text("Caja1"),
          ),
          Container(
            color: Colors.blue,
            child: Text("Caja2"),
          ),
          Container(
            color: Colors.yellow,
            child: Text("Caja3"),
          ),
          Container(
            child: FlatButton(
              color: Colors.grey,
              child: Text("Expand&Flex"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Expand()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
