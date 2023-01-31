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


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(32),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Constatel",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderSide: BorderSide(color: Colors.grey[200])
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderSide: BorderSide(color: Colors.grey[300])
                  ),
                  filled: true,
                  //fillColor: Colors.grey[100],
                  hintText: "Phone Number"),
              controller: _phoneController,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            /** ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                signInWithPhoneNumber(context, _phoneController.text.trim());
                },
                child: const Text('Login'),
                ),**/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  signInWithPhoneNumber(context, _phoneController.text.trim());
                  /** if (_formKey.currentState!.validate()) {
                      String mobile =
                      countryCode + phoneController.text.trim();
                      await signInPhone(mobile, context);
                      }**/
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF2B903)),
                child: Container(
                  //color:  Color(0xFFF2B903),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Continuer',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
