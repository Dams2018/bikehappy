import 'package:bikehappy/screens/home/Lugares.dart';
import 'package:bikehappy/screens/home/home.dart';
import 'package:bikehappy/screens/home/dinero.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;
  BitmapDescriptor myIcon;


  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/logo.png')
        .then((onValue) {
      myIcon = onValue;
    });
    // TODO: implement initState
    super.initState();

    arriendos.forEach((element) {

      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: true,
          icon: myIcon,
          infoWindow:
              InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoords)
      );

    });

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _List(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
        },
        child: Stack(children: [
          Center(
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  height: 125.0,
                  width: 275.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Row(children: [
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        arriendos[index].thumbNail),
                                    fit: BoxFit.cover))),
                        SizedBox(width: 5.0),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                arriendos[index].shopName,
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                arriendos[index].address,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 170.0,
                                child: Text(
                                  arriendos[index].description,
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ])
                      ]))))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 50.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(-33.363291, -70.678002), zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            ActionChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: CirclePeso(),
              ),
                backgroundColor: Colors.transparent,
              elevation: 5,
              label: Text('2500'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dinero()),
                );
              },

            ),
          ],
        )),
        Positioned(
          bottom: 20.0,
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: arriendos.length,
              itemBuilder: (BuildContext context, int index) {
                return _List(index);
              },
            ),
          ),
        ),

      ],
    ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: arriendos[_pageController.page.toInt()].locationCoords,
        zoom: 17.0,
        bearing: 45.0,
        tilt: 45.0)));
  }


  void _currentLocation() async {
    final GoogleMapController controller = await _controller;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }
}


