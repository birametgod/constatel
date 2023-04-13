import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/my_text_field.dart';
import 'package:constatel/widgets/car_button.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  List<Widget> _carButtonRow = [CarButton(carNumber: 1)];

  void _addCarButtonToRow() {
    setState(() {
      _carButtonRow.add(
        CarButton(carNumber: _carButtonRow.length + 1),
      );
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ConstatelText(
                        title: "Etape 2/5: Nouveau constat",
                        color: Colors.grey,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            hintText: 'Numéro de téléphone',
                            inputType: TextInputType.name,
                            myController: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            hintText: "Plaque d'immatriculation",
                            inputType: TextInputType.name,
                            myController: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  ConstatelText(
                        title: "Vehicules concernés",
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: _carButtonRow,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: _addCarButtonToRow,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            child: Container(
                                padding: EdgeInsets.only(
                                    right: 20.0, top: 20.0, bottom: 20.0),
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
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    ConstatelText(
                                        title: "Ajout Vehicule",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500),
                                  ],
                                ))),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0, right: 30.0),
                    child: MyTextButton(
                      backgroundColor: Colors.black87,
                      buttonName: 'Suivant',
                      onTap: () {
                        Navigator.pushNamed(context, 'damage');
                      },
                    ),
                  )
                ],
              ))
            ],
          ),
        )));
  }
}
