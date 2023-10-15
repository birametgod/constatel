import 'package:flutter/material.dart';
import 'package:constatel/screens/homeScreen.dart';
import 'package:constatel/services/authentication.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:constatel/widgets/expandable_fab.dart';
import 'package:constatel/widgets/action_button.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:constatel/services/location_service.dart';
import 'package:constatel/screens/requiredFileScreen.dart';
import 'package:constatel/app_colors.dart';
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
    print("okok");
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
    DefaultAssetBundle.of(context)
        .loadString('assets/mapTheme/constatel.json')
        .then((value) {
      mapTheme = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      controller.setMapStyle(mapTheme);
                      _controller.complete(controller);
                    },
                    myLocationButtonEnabled: false,
                    mapToolbarEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 13.5,
                    ),
                    myLocationEnabled: true,
                    circles: {
                      Circle(
                        circleId: CircleId("1"),
                        center: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        radius: 420,
                        strokeWidth: 0,
                        fillColor: Color(0xFF006491).withOpacity(0.2),
                      ),
                    },
                  ),
                ),
                Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 40.0,
                      height: 60.0,
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9,
                                spreadRadius: 2,
                                offset: Offset(1, 1))
                          ]),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_rounded,
                            color: Color(0xFFF0993B),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                              child: Text(
                            'Veuillez vous déplacer vers un endroit sûr et ne pas gêner la circulation.',
                          ))
                        ],
                      ),
                    ))
              ],
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.constatel.blue,
                onPressed: () => locateToLocation(),
                heroTag: 'location',
                child: Icon(Icons.my_location)
            ),
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
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RequiredFileScreen(),
                      ),
                    )
                  },
                  icon: const Icon(Icons.car_crash),
                ),
                ActionButton(
                  onPressed: () => _showAction(context, 2),
                  icon: const Icon(Icons.map_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
