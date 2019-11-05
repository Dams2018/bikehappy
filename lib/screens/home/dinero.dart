import 'package:bikehappy/screens/home/AgregarDinero.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:bikehappy/screens/home/trans.dart';
import 'package:bikehappy/screens/home/user.dart';
import 'package:bikehappy/screens/home/user.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

//stfu

class Dinero extends StatefulWidget {
  @override
  _DineroState createState() => _DineroState();
}

class _DineroState extends State<Dinero> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  String cardNumber = '5415 4156 2646 5566';
  String expiryDate = '06/25';
  String cardHolderName = 'MARCO ASTORGA G.';
  String cvvCode = '055';
  bool isCvvFocused = false;

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
          body: SafeArea(
            child: Column(
              children: <Widget>[
                CreditCardWidget(
                  cardBgColor: Colors.blueGrey,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 450.0,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Trans(),
                      Trans(),
                      Trans(),
                      Trans(),
                      Trans(),
                    ],
                  ),
                )
              ],
            ),
          ),

          //boton
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgregarDinero()),
              );
            },
            tooltip: 'Nueva Forma de Pago',
            backgroundColor: Colors.red,
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}
