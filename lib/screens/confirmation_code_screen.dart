import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/screens/personal_details.dart';

class ConfirmationCodeScreen extends StatefulWidget {

  final String verificationId;

  const ConfirmationCodeScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  _ConfirmationCodeScreenState createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final TextEditingController _confirmationCodeController =
      TextEditingController();
  final phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SN');
  String phoneNumber = "";
  final TextEditingController _codeController1 = TextEditingController();
  final TextEditingController _codeController2 = TextEditingController();
  final TextEditingController _codeController3 = TextEditingController();
  final TextEditingController _codeController4 = TextEditingController();
  final TextEditingController _codeController5 = TextEditingController();
  final TextEditingController _codeController6 = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    _codeController1.dispose();
    _codeController2.dispose();
    _codeController3.dispose();
    _codeController4.dispose();
    _codeController5.dispose();
    _codeController6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c4372),
      body: SafeArea(
        child:  GestureDetector(
            onTap: () {
              // Dismiss the keyboard when tapping outside the text field
              FocusScope.of(context).unfocus();
            },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Maintenant, vérifiez votre numéro de téléphone",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start, // Center align the text
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildConfirmationCodeInput(_codeController1),
                          SizedBox(width: 10.0),
                          buildConfirmationCodeInput(_codeController2),
                          SizedBox(width: 10.0),
                          buildConfirmationCodeInput(_codeController3),
                          SizedBox(width: 10.0),
                          buildConfirmationCodeInput(_codeController4),
                          SizedBox(width: 10.0),
                          buildConfirmationCodeInput(_codeController5),
                          SizedBox(width: 10.0),
                          buildConfirmationCodeInput(_codeController6),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Veuillez saisir le code de confirmation que nous venons de vous envoyer par SMS.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                RoundedButton(
                    text: 'Continuez',
                    color: Colors.white,
                    textColor: Colors.black,
                    widthNumber: 0.9,
                    onPressed: () async {
                      // Concatenate the input confirmation code
                      String confirmationCode = _codeController1.text +
                          _codeController2.text +
                          _codeController3.text +
                          _codeController4.text +
                          _codeController5.text +
                          _codeController6.text;
                      try {
                        // Sign in with the confirmation code
                        await FirebaseAuth.instance.signInWithCredential(
                          PhoneAuthProvider.credential(
                            verificationId: widget.verificationId, // You need to get the verificationId from the previous screen
                            smsCode: confirmationCode,
                          ),
                        );

                        // Navigate to the next screen
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return PersonalDetails();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child; // No transition effect
                            },
                            transitionDuration: Duration(milliseconds: 0), // No transition duration
                          ),
                        );
                      } catch (error) {
                        print('Error signing in: $error');
                        // Handle sign-in error
                      }
                    }),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget buildConfirmationCodeInput(TextEditingController controller) {

    bool isBorderClicked = false;

    return GestureDetector(
        onTap: () {
          setState(() {
            isBorderClicked = !isBorderClicked;
          });
        },
        child: Container(
          width: 50.0,
          height: 60.0,
          padding: EdgeInsets.only(top: 15.0),
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the input
            borderRadius: BorderRadius.circular(27.0), // Adjust the border radius as needed
            border: Border.all(
              color: isBorderClicked ? Colors.blue : Colors.black, // Border color, // Border color
              width: 3.0, // Border width
            ),
          ),
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Move focus to the next input when a character is entered
              if (value.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
    );
  }

  // Replace this with your logic to validate the confirmation code
  bool confirmationCodeIsValid(String code) {
    // Add your validation logic here
    // For example, you can check the code against the one sent to the user
    return code == '123456'; // Replace '123456' with the actual expected code
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Welcome to the next screen!'),
      ),
    );
  }
}
