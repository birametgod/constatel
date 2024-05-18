import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:constatel/providers/auth_provider.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/screens/sign_phone_number_screen.dart';
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
            builder: (context) => SignInWithPhoneNumberScreen(),
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
          content: Text(
              'An error occurred while signing in. Please try again.${e.toString()}'),
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
        backgroundColor: Color(0xff3c4372),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Add your widgets here
                Image.asset(
                  'assets/images/carDrawing.png',
                  fit: BoxFit.contain,
                ),
                Column(
                  children: [
                    Align(
                        child: Text(
                      "ConstaTel",
                      style: TextStyle(
                          fontFamily: 'Malick',
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.18,
                          fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Align(
                        child: Text(
                      "Connect, share, care",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                RoundedButton(
                  text: 'Commencer',
                  color: Colors.white,
                  textColor: Colors.black, // Set the text color to red
                  onPressed: _signInAsGuest,
                  widthNumber: 0.4,
                ),
              ],
            ),
          ),
        ));
  }
}
