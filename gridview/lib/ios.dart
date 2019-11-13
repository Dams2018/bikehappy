import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosVentana extends StatefulWidget {
  @override
  _IosVentanaState createState() => _IosVentanaState();
}

class _IosVentanaState extends State<IosVentana> {
  Widget androidLayout(){
    return RaisedButton(
      color: Colors.green,
      child: Text("Android"),
      onPressed: (){},
    );
  }

  Widget iosLayout(){
    return CupertinoButton(
      color: Colors.red,
      child: Text("IOS"),
      onPressed: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IOS & Android"),
      ),
      body: Theme.of(context).platform == TargetPlatform.android
      ?
      androidLayout()
      :
      iosLayout(),
    );
  }
}
