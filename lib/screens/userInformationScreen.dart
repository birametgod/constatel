import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/my_text_field.dart';
import 'package:constatel/widgets/car_button.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/providers/auth_provider.dart' as Constatel;
import 'package:constatel/providers/car_provider.dart';
import 'package:provider/provider.dart';
import 'package:constatel/models/user.dart';
import 'package:constatel/app_colors.dart';
import 'package:constatel/models/car.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:constatel/widgets/rounded_button.dart';


class UserInformationScreen extends StatefulWidget {

  const  UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final licensePlateController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final descriptionController = TextEditingController();

  late Constatel.AuthProvider authProvider;
  late CarProvider carProvider;

  bool _isEditingCar = false; // Add this variable
  List<Car> _cars = [];
  bool isLoading = true; // Initially set to true to show the loader
  Car? _selectedCar;

  void _addCarButtonToRow(CarProvider carProvider, Constatel.AuthProvider authProvider) {
    if (_formKey.currentState!.validate()) {
      if (!_isEditingCar) {
        setState(() {
          final newCar = Car(
              ownerName: nameController.text,
              model: modelController.text,
              brand: brandController.text,
              licensePlate: licensePlateController.text,
              ownerPhoneNumber: phoneNumberController.text,
              userWhoReportId: authProvider.currentUser!.uid,
              description: descriptionController.text
          );
          _cars.add(newCar);
          // Save the car using the CarProvider
          carProvider.addCar(newCar,);
          nameController.clear();
          phoneNumberController.clear();
          licensePlateController.clear();
          brandController.clear();
          modelController.clear();
          descriptionController.clear();
          _isEditingCar = false; // Reset editing state
        });
      }
    }
  }

  _updateFieldsWithCar(Car car) {
    print(car.brand + ' ' + car.model);
    setState(() {
      _selectedCar = car;
      nameController.text = car.ownerName; // Update with user info
      phoneNumberController.text =
          car.ownerPhoneNumber; // Update with user info
      licensePlateController.text = car.licensePlate; // Update with car info
      brandController.text = car.brand;
      modelController.text = car.model;
      _isEditingCar = true; // Set editing state
    });
  }

  void _onDoneButtonPressed(CarProvider carProvider) async {
    // Handle what you want to do when the "Done" button is pressed.
    // save the edited car information and hide the button.
    if (_formKey.currentState!.validate()) {
      if (_selectedCar != null) {
        // Save the edited car information here
        // Example: await authProvider.updateCarInfo(_selectedCar);
        // Update the car object with values from text fields
        _selectedCar!.ownerName = nameController.text;
        _selectedCar!.ownerPhoneNumber = phoneNumberController.text;
        _selectedCar!.licensePlate = licensePlateController.text;
        _selectedCar!.brand = brandController.text;
        _selectedCar!.model = modelController.text;
        _selectedCar!.description = descriptionController.text;
        try {
          // Use the car's ID to update the corresponding document in Firestore
          await carProvider.updateCar(_selectedCar!);
          // Clear the selected car and update the UI
          setState(() {
            _selectedCar = null;
            _isEditingCar = false; // Hide the "Done" button after saving.
            nameController.clear();
            phoneNumberController.clear();
            licensePlateController.clear();
            modelController.clear();
            brandController.clear();
            descriptionController.clear();
          });
        } catch(e) {
          // Handle errors here
          print('Error updating car: $e');
        }
      }

      // Save the edited car information to Firestore or wherever you need.
    }
  }

  Future<void> fetchUserCars() async {
     authProvider = Provider.of<Constatel.AuthProvider>(context, listen: false);
     carProvider = Provider.of<CarProvider>(context, listen: false);

    try {
      final cars = await carProvider.getCarsForUser(authProvider.currentUser!.uid);
      setState(() {
        _cars = cars;
        isLoading = false; // Set isLoading to false when data is loaded
      });
    } catch (e) {
      print('Error fetching user cars: $e');
      isLoading = false; // Set isLoading to false when data is loaded
    }
  }


  void _saveUserInfoToFirestore(Constatel.AuthProvider authProvider) async {
    final user = authProvider.currentUser;
    if (user != null && _formKey.currentState!.validate()) {
      final userInfo = UserModel(
        id: user.uid,
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
      );
      await authProvider.saveUserInfo(userInfo);
    }

    for (final car in _cars) {
      // You can save each car to Firestore here
      // Example: await authProvider.saveCarInfo(car);
    }

    // Navigate to the next screen (e.g., 'damage' screen)
    Navigator.pushNamed(context, 'damage');
  }

  List<Widget> _buildCarButtons() {
    return _cars.map((car) {
      final isSelected = car == _selectedCar; //Check if the car is selected
      return CarButton(
        ownerName: car.ownerName,
        carNumber: _cars.indexOf(car) + 1,
        car: car,
        isSelected: isSelected,
        onCarButtonTap: () {
          // Populate the text fields with car information for editing
          _updateFieldsWithCar(car);
        },
      );
    }).toList();
  }

  // Validators for form fields
  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer du texte';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer du texte';
    }
    // Check if it's a valid phone number format.
    final phoneNumberRegExp =
        RegExp(r'^\d{9}$'); // Assumes a 10-digit phone number.
    if (!phoneNumberRegExp.hasMatch(value)) {
      return "Veuillez entrer un numéro de telephone valide.";
    }
    return null;
  }

  String? _validateLicensePlate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer du texte';
    }
    final licensePlate = value.trim();
    // Check if it matches the Senegalese license plate format.
    final licensePlateRegExp = RegExp(r'^[A-Z]{2}\s\d{3}\s[A-Z]{2}$');

    if (!licensePlateRegExp.hasMatch(licensePlate)) {
      return "Entrez un numéro d'immatriculation valide (AA 123 AA).";
    }
    return null;
  }

  @override
  void initState() {
    // Fetch the user's cars and update the _cars list
    isLoading = true;
    fetchUserCars();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    licensePlateController.dispose();
    brandController.dispose();
    modelController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: Color(0xff3c4372),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff3c4372),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            if (_isEditingCar) // Show the "Done" button only when editing a car
              TextButton(
                onPressed: () {
                  _onDoneButtonPressed(carProvider);
                },
                child: Text(
                  'Terminé',
                  style: TextStyle(
                    color: AppColors.constatel.blue, // Customize the text color
                    fontSize: 16.0, // Customize the font size
                  ),
                ),
              ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstatelText(
                          title: "Etape 2/5: Nouveau constat",
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstatelText(
                          title: "Infos Véhicule(s)",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          size: 25.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, right: 30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              hintText: 'Prenom Nom',
                              inputType: TextInputType.name,
                              myController: nameController,
                              validator: _validateName,
                            ),
                            MyTextField(
                              hintText: 'Numéro de téléphone',
                              inputType: TextInputType.phone,
                              myController: phoneNumberController,
                              validator: _validatePhoneNumber,
                            ),
                            MyTextField(
                                hintText: "Plaque d'immatriculation",
                                inputType: TextInputType.text,
                                myController: licensePlateController,
                                validator: _validateLicensePlate),
                            MyTextField(
                                hintText: "Marque",
                                inputType: TextInputType.text,
                                myController: brandController,
                                validator: _validateName),
                            MyTextField(
                                hintText: "Modèle",
                                inputType: TextInputType.text,
                                myController: modelController,
                                validator: _validateName),
                            SizedBox(
                              height: 5.0,
                            ),
                            TextField(
                              controller: descriptionController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.white
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.redAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.redAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  )
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstatelText(
                          title: "Vehicules concernés",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: _buildCarButtons(),
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Flexible(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: _isEditingCar
                                  ? null
                                  : () {
                                _addCarButtonToRow(carProvider, authProvider);
                              },
                              style: ElevatedButton.styleFrom(
                                 // primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0))),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      right: 10.0, top: 20.0, bottom: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                            BorderRadius.circular(5.0)),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.constatel.blue,
                                          size: 30.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      ConstatelText(
                                        title: "Ajout Vehicule",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500,
                                        size: 15.0,
                                      ),
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  ],
                ),
              ),),
              RoundedButton(
                  text: 'Continuer',
                  color: Colors.white,
                  textColor: Colors.black,
                  widthNumber: 0.9,
                  onPressed: () {
                    Navigator.pushNamed(context, 'damage');
                  } ),
              /*Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 30.0),
                child: MyTextButton(
                  backgroundColor: Colors.black87,
                  buttonName: 'Suivant',
                  onTap: () {
                    Navigator.pushNamed(context, 'damage');
                  },
                ),
              ),*/
            ],
          )
        )));
  }
}

//^: This symbol denotes the start of the string, ensuring that the matching pattern starts at the beginning of the text.
//
// [A-Z0-9]: This part of the pattern is enclosed in square brackets [] and matches a single character. It specifies that the character must be an uppercase letter (A to Z) or a digit (0 to 9). In other words, it allows only uppercase letters and digits.
//
// {1,7}: This part of the pattern specifies the minimum and maximum number of characters that should match the previous pattern [A-Z0-9]. It means that there should be at least 1 character and at most 7 characters matching the pattern.
//
// $: This symbol denotes the end of the string, ensuring that the matching pattern ends at the end of the text.
//
// Putting it all together:
//
// ^: Match the start of the string.
// [A-Z0-9]: Match a single character that is either an uppercase letter or a digit.
// {1,7}: Match between 1 and 7 characters that meet the previous pattern.
// $: Match the end of the string.
// So, in plain English, this regex pattern checks if the provided text:
//
// Starts with an uppercase letter (A to Z) or a digit (0 to 9).
// Followed by 1 to 7 characters, where each character is an uppercase letter or a digit.
// Ends after those characters.
