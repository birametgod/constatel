import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/screens/confirmation_code_screen.dart';
import 'package:constatel/services/authentication.dart';

class SignInWithPhoneNumberScreen extends StatefulWidget {
  const SignInWithPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<SignInWithPhoneNumberScreen> createState() =>
      _SignInWithPhoneNumberScreenState();
}

class _SignInWithPhoneNumberScreenState
    extends State<SignInWithPhoneNumberScreen> {
  final phoneController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'SN');
  String phoneNumber = "";

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c4372),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Commençons par le numéro de téléphone, c'est parti !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the "button"
                      borderRadius: BorderRadius.circular(40.0), // Adjust the border radius as needed
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        phoneNumber = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {
                        debugPrint('$value');
                      },
                      searchBoxDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black, // Set the desired background color
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green), // Set the border color when focused
                          borderRadius: BorderRadius.circular(10), // Set the border radius
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey), // Set the border color when enabled
                          borderRadius: BorderRadius.circular(10), // Set the border radius
                        ),
                      ),
                      inputDecoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // Remove the border
                        ),
                      ),
                      autoValidateMode: AutovalidateMode.disabled,
                      initialValue: number,
                      textFieldController: phoneController,
                      inputBorder: InputBorder.none,
                      formatInput: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  RoundedButton(
                    text: 'Continuer',
                    color: Colors.white,
                    textColor: Colors.black,
                    widthNumber: 0.9,
                    onPressed: () async {
                      await signInWithPhoneNumber(context, "+221771923456");
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Si vous n'avez pas de compte, vous serez redirigé pour en créer un nouveau",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
