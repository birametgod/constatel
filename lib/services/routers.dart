import 'package:constatel/screens/map_screen.dart';
import 'package:constatel/screens/requiredFileScreen.dart';
import 'package:constatel/screens/damage_screen.dart';
import 'package:constatel/screens/userInformationScreen.dart';
import 'package:constatel/screens/claim_information_screen.dart';
import 'package:constatel/screens/claim_confirmation_screen.dart';
import 'package:constatel/screens/sign_phone_number_screen.dart';
import 'package:constatel/screens/login_screen.dart';
import 'package:constatel/screens/personal_details.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case 'map':
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case 'required':
        return MaterialPageRoute(builder: (_) => const RequiredFileScreen());
      case 'damage':
        return MaterialPageRoute(builder: (_) => const DamageScreen());
      case 'info':
        return MaterialPageRoute(builder: (_) =>  const UserInformationScreen());
      case 'claim':
        return MaterialPageRoute(builder: (_) =>  const ClaimInformation());
      case 'confirmation':
        return MaterialPageRoute(builder: (_) => const ClaimConfirmation());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case 'sign':
        return MaterialPageRoute(builder: (_) => const SignInWithPhoneNumberScreen());
      case 'personalDetails':
        return MaterialPageRoute(builder: (_)=> const PersonalDetails());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No Route defined for ${settings.name}')
            ),
          );
        });
    }
  }
}