import 'package:bikehappy/models/user.dart';
import 'package:bikehappy/screens/authenticate/authenticate.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user=Provider.of<User>(context);
    print(user);
    // return either the Home or Authenticate widget
    if (user==null) {
      return Authenticate();
    }else{
      return Home();
    }
    
  }
}

