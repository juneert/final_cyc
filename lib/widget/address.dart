import 'package:cyc_test/widget/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address extends StatefulWidget {
  //late final String title;
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 300,
                  margin: const EdgeInsets.all(16),
                  child: Image.asset(
                    'images/car4.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('พีวาย คาร์แคร์ ภูเก็ต'),
            ),
            const ListTile(
              leading: Icon(Icons.add_location),
              title: Text('5/1 ถ.วิรัชหงส์หยก ตลาดเหนือ เมือง ภูเก็ต 83000'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+66815358969'),
            ),
            //showMap(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MapPage()));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add_location_alt_outlined,
        ),
      ),
    );
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
}
