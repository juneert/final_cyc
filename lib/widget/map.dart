import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //Field
  late double lat, lng;
  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat = locationData!.latitude!;
      lng = locationData.longitude!;
    });
    print('lat = $lat, lng =$lng');
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('Flutter Google Maps'),
      ),
      body: Center(
        child: Column(
          children: [
            lat == null ? MyStyle().showProgess() : showMap(),
          ],
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>{
      Marker(
          markerId: const MarkerId('myMap'),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title: "พีวาย คาร์แคร์ ภูเก็ต",
            snippet: 'ละติจูด $lat,ลองติจูด $lng',
          ))
    };
  }

  SizedBox showMap() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return SizedBox(
      height: 600,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }
}

  // Container showMap() {
  //   LatLng latLng = const LatLng(7.880232, 98.377371);
  //   CameraPosition cameraPosition = CameraPosition(
  //     target: latLng,
  //     zoom: 16.0,
  //   );
  //   return Container(
  //     height: 300,
  //     child: GoogleMap(
  //       initialCameraPosition: cameraPosition,
  //       mapType: MapType.normal,
  //       onMapCreated: (controller) {},
  //     ),
  //   );
  // }
