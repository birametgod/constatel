import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:constatel/screens/requiredFileScreen.dart';
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
      backgroundColor: Colors.white,
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
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          //primary: Color(0xff3c4372), // Use provided color or default to black87
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.home_filled,
                                    color: Colors.white, size: 30.0),
                                onPressed: () {
                                  // Handle Home icon tap
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.car_crash,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RequiredFileScreen(),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.perm_identity_sharp,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  // Handle Settings icon tap
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))
              ],
            ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0, right: 20.0),
            child: FloatingActionButton(
              backgroundColor: Color(0xff3c4372),
              onPressed: () => locateToLocation(),
              heroTag: 'location',
              child: Icon(Icons.my_location),
            ),
          ),
        ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const CustomFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    const double buttonDiameter = 56.0;
    const double margin = 8.0;

    final double x = (scaffoldGeometry.scaffoldSize.width - buttonDiameter) / 2.0;
    final double y = scaffoldGeometry.contentBottom - buttonDiameter - margin;

    return Offset(x, y);
  }
}

