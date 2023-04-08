
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LayoutUserAppGoogleMap extends StatefulWidget {

  @override
  State<LayoutUserAppGoogleMap> createState() => _LayoutUserAppGoogleMapState();
}

class _LayoutUserAppGoogleMapState extends State<LayoutUserAppGoogleMap> {
  final CameraPosition _initialposition = CameraPosition(target: LatLng(24.903623, 67.198367));
  final List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(initialCameraPosition: _initialposition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
          });
        },


      ),
    );
  }
}
