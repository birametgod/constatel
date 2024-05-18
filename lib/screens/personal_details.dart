import 'package:constatel/screens/requiredFileScreen.dart';
import 'package:flutter/material.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/screens/map_screen.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.7),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Informations personnelles !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start, // Center align the text
                  ),
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80.0,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the input
                  borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nom d'utilisateur", // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80.0,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the input
                  borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Adresse e-mail', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80.0,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the input
                  borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Date de naissance', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80.0,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the input
                  borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
                ),
                child: TextFormField(
                  textAlign: TextAlign.start  ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ville', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80.0,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the input
                  borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ville', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Column(
                children: [
                  RoundedButton(
                      text: 'Ignorer',
                      color: Colors.white,
                      textColor: Colors.black,
                      widthNumber: 0.9,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const RequiredFileScreen();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child; // No transition effect
                            },
                            transitionDuration: Duration(milliseconds: 0), // No transition duration
                          ),
                        );
                      }),
                  SizedBox(height: 10.0,),
                  RoundedButton(
                      text: 'Continuer',
                      color: Colors.orange,
                      textColor: Colors.white,
                      widthNumber: 0.9,
                      onPressed: () {
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
