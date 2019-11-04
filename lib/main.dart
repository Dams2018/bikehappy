import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bikehappy/models/user.dart';
import 'package:bikehappy/screens/wrapper.dart';
import 'package:bikehappy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:custom_splash/custom_splash.dart';



final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyApp(), 2: MyApp()};
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
      child: CustomSplash(
        imagePath: 'assets/logo.png',
        backGroundColor: Colors.black,
        logoSize: 100,
        home: MyApp(),
        customFunction: duringSplash,
        duration: 3500,
        type: CustomSplashType.StaticDuration,
        outputAndHome: op,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
