import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:blackanova/screens/connexion_screen.dart';
import 'package:blackanova/screens/splash_screen.dart';
import 'package:blackanova/screens/onboarding_page.dart';
import 'package:blackanova/screens/verify_screen.dart';
import 'package:blackanova/screens/welcome_screen.dart';

FirebaseAuth auth  = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

signInWithPhoneNumber(BuildContext context))  {
 auth.verifyPhoneNumber(
     phoneNumber: "+33752516199",
     // Automatic handling of the SMS code on Android devices.
     verificationCompleted: (PhoneAuthCredential credential) async {
       // Android ONLY
       // Sign the user in (or link) with the auto-generated credential
       await auth.signInWithCredential(credential);
     },
     // Handle failure events such as invalid phone numbers or whether the SMS quota has been exceeded.
     verificationFailed: (FirebaseAuthException e) {
       print('Failed with error code: ${e.code}');
       print(e.message);
     },
     // Handle when a code has been sent to the device from Firebase, used to prompt users to enter the code.
     codeSent: (String verificationId, int? resendToken ) async {
       // resendToken only supported in android devices
       // Update the UI - wait for the user to enter the SMS code
       String smsCode = 'xxxx';

       // Create a PhoneAuthCredential with the code
       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

       //Sign the user in with the credential
      await auth.signInWithCredential(credential);
     },
     // Handle a timeout of when automatic SMS code handling fails.
     codeAutoRetrievalTimeout: (String verificationId) {
       // Auto-resolution timed out...
       /** On Android devices which support automatic SMS code resolution,
        * this handler will be called if the device has not automatically resolved an SMS message within a certain timeframe.
        * Once the timeframe has passed, the device will no longer attempt to resolve any incoming messages.
           By default, the device waits for 30 seconds however this can be customized with the timeout argument:**/
     })
}
