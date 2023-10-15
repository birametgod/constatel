import 'package:flutter/material.dart';
import 'package:constatel/screens/homeScreen.dart';
import 'package:constatel/services/authentication.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:constatel/widgets/expandable_fab.dart';
import 'package:constatel/widgets/action_button.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:constatel/services/location_service.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:provider/provider.dart';
import 'package:constatel/providers/auth_provider.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/screens/mapScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  String? _userName;
  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _signInAsGuest() async {
    try {
      final userId = await AuthProvider().signInAsGuest();

      if (userId != null) {
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'userId': userId,
          // Add any other user information you want to save
        });
        // Save the user ID to Firebase
        await AuthProvider().saveUserId(userId);
        // Navigate to the next screen (MapScreen or HomeScreen)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ),
        );
      } else {
        // Handle guest sign-in error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Unable to sign in as guest. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Handle sign-in error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while signing in. Please try again.${e.toString()}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Add your widgets here
                ListTile(
                  title: Text(
                    _userName != null
                        ? 'Welcome, $_userName!'
                        : 'Welcome to Constatel',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    'Here is a second line',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.0),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: MediaQuery.of(context).size.height * 1 / 2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/inFrontOfTheCar.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                RoundedButton(
                  text: 'Get Started',
                  onPressed: () {
                    // Add your logic when the user taps the button
                  },
                ),
                RoundedButton(
                  text: 'Continue as guest',
                  color: Colors.white,
                  textColor: Colors.black, // Set the text color to red
                  onPressed: _signInAsGuest
                ),
              ],
            ),
          ),
        ));
  }
}
