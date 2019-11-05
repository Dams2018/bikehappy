import 'package:bikehappy/screens/home/home.dart';
import 'package:bikehappy/screens/home/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

//stfu

class AgregarDinero extends StatefulWidget {
  @override
  _AgregarDineroState createState() => _AgregarDineroState();
}

class _AgregarDineroState extends State<AgregarDinero> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
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
                Expanded(
                  child: SingleChildScrollView(
                    child: CreditCardForm(
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                  ),
                ),Container(
                  child:
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            title: new Text("Exelente",style: TextStyle(color: Colors.grey),),
                            content: new Text("Haz agregado, una nueva forma de pago"),

                          )
                      );
                    },
                    child: Text(
                      "Agregar",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],

    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
