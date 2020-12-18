import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:listar_flutter/utils/utils.dart';

class NeighbourLocation extends StatefulWidget {

  @override
  _NeighbourLocationState createState() {
    return _NeighbourLocationState();
  }
}

class _NeighbourLocationState extends State<NeighbourLocation> {
  CameraPosition _initPosition;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  void initState() {
    _onLoadMap();
    super.initState();
  }

  ///On load map
  void _onLoadMap() {
    final MarkerId markerId = MarkerId("1");
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(100, 100),
      infoWindow: InfoWindow(title: "brampton"),
      onTap: () {},
    );

    setState(() {
      _initPosition = CameraPosition(
        target: LatLng(100, 100),
        zoom: 14.4746,
      );
      _markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('location'),
        ),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: _initPosition,
          markers: Set<Marker>.of(_markers.values),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}
