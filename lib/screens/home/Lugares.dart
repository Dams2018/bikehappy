import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lugar {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Lugar(
      {this.shopName,
        this.address,
        this.description,
        this.thumbNail,
        this.locationCoords});
}

final List<Lugar> arriendos = [
  Lugar(
      shopName: 'Duoc UC: Sede Plaza Norte',
      address: 'Calle Nueva 1660',
      description:
      'Centro de formación profesional',
      locationCoords: LatLng(-33.363291, -70.678002),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipMvtEO1zb4R3rFUypzSbKrrTvCJlo_ao8sNRkR-=w408-h240-k-no-pi-10-ya9.999999-ro-0-fo100'
  ),
  Lugar(
      shopName: 'Mallplaza Norte',
      address: 'Av. Américo Vespucio 1737',
      description:
      'Centro comercial',
      locationCoords: LatLng(-33.365628, -70.678499),
      thumbNail: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Mall_Plaza_Norte_Exterior.jpg'
  )
];
