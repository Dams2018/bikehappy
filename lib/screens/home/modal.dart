import 'package:bikehappy/screens/home/QR_Flutter.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qrscaner/flutter_qrscaner.dart';
class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                    color: Color(0xFF737373),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          _createTile(context, 'B0000001', 'Disponible',
                              Icons.directions_bike, _action1),
                          _createTile(context, 'B0000002', 'Disponible',
                              Icons.directions_bike, _action2),
                          _createTile(context, 'B0000003', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000004', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000005', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000006', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000007', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000008', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000009', 'Disponible',
                              Icons.directions_bike, _action3),
                          _createTile(context, 'B0000010', 'Disponible',
                              Icons.directions_bike, _action3),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(3),
                          topRight: const Radius.circular(3),
                        )
                      ),
                    )),
              )
            ],
          );
        });
  }

  ListTile _createTile(BuildContext context, String name, String subname,
      IconData icon, Function action) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      subtitle: Text(subname),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyQR()),
        );
      },
    );
  }

  _action1() {

  }

  _action2() {
    print('action 2');
  }

  _action3() {
    print('action 3');
  }


}
