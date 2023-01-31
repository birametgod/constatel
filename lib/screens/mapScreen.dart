import 'package:flutter/material.dart';
import 'package:constatel/screens/homeScreen.dart';
import 'package:constatel/services/authentication.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:constatel/widgets/expandable_fab.dart';
import 'package:constatel/widgets/action_button.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:constatel/services/location_service.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  String mapTheme = '';
  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) {
        currentLocation = location;
        print(currentLocation);
        setState(() {});
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
          (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  void locateToLocation() async {
    print(currentLocation);
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
        ),
      ),
    );
    setState(() {});
  }

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  /*
  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyCsssm2muVjmMAZ43uuFdKKjqtNDXG7LEI", // Your Google Map Key
      PointLatLng(_center.latitude, _center.longitude),
      PointLatLng(_centerTwo.latitude, _centerTwo.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    DefaultAssetBundle.of(context).loadString('assets/mapTheme/constatel.json').then((value) {
      mapTheme = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE7E7E7),
        body:  currentLocation == null
            ? const Center(child: Text("Loading"))
            : GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapTheme);
            _controller.complete(controller);
          },
          myLocationButtonEnabled: false,
          mapToolbarEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 13.5,
          ),
          myLocationEnabled: true,
          circles: {
            Circle(
              circleId: CircleId("1"),
              center: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
              radius: 420,
              strokeWidth: 0,
              fillColor: Color(0xFF006491).withOpacity(0.2),
            ),
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                  onPressed: () => locateToLocation() ,
                  child: Icon(
                      Icons.my_location
                  )),
              Expanded(
                child: Container(),
              ),
              ExpandableFab(
                distance: 112.0,
                children: [
                  ActionButton(
                    onPressed: () => _showAction(context, 0),
                    icon: const Icon(Icons.person),
                  ),
                  ActionButton(
                    onPressed: () =>  {},
                    icon: const Icon(Icons.car_crash),
                  ),
                  ActionButton(
                    onPressed: () => _showAction(context, 2),
                    icon: const Icon(Icons.home_filled),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
