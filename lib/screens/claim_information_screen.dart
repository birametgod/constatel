import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/my_text_field.dart';
import 'package:constatel/widgets/car_button.dart';
import 'package:constatel/widgets/highlight_button.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';

class ClaimInformation extends StatefulWidget {
  const ClaimInformation({Key? key}) : super(key: key);

  @override
  State<ClaimInformation> createState() => _ClaimInformationState();
}

class _ClaimInformationState extends State<ClaimInformation> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  bool highLighted = false;

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
                      title:"Etape 4/5: Nouveau constat",
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ConstatelText(
                        title:"Infos Accident",
                        fontWeight: FontWeight.w500,
                        size: 25.0
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            hintText: 'Lieu',
                            inputType: TextInputType.name,
                            myController: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Date de l'accident",
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                                      },
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: AppColors.constatel.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 1,
                                          color: Colors.redAccent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.redAccent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      16), // Add some spacing between the text fields
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Heure de l'accident",
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context: context
                                        );
                                      },
                                      child: Icon(
                                        Icons.access_time_rounded,
                                        color:  AppColors.constatel.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 1,
                                          color: Colors.redAccent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.redAccent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText: 'Write a description',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
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
                                    width: 3,
                                    color: Colors.redAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            maxLines:
                                4, // set the maximum number of lines for the input
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
                    child: Text(
                      "Montant des dommages",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child:  Row(
                        children: [
                          Expanded(child: GestureDetector(
                            onTap: () {
                              setState(() {
                                highLighted = !highLighted;
                              });
                            },
                            child: HighLightButton(title: '<= 500 FCFA',color: AppColors.constatel.blue, isHighLighted: highLighted,),
                          )),
                          Expanded(child: GestureDetector(
                            onTap: () {
                              setState(() {
                                highLighted = !highLighted;
                              });
                            },
                            child: HighLightButton(title: '> 500 FCFA', color:  AppColors.constatel.blue, isHighLighted: !highLighted,),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0, right: 30.0),
                    child: MyTextButton(
                      backgroundColor: Colors.black87,
                      buttonName: 'Suivant',
                      onTap: () {
                        Navigator.pushNamed(context, 'confirmation');
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
