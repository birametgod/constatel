import 'package:constatel/models/car.dart';
import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/row_with_text.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/widgets/rounded_button.dart';
import 'package:constatel/providers/auth_provider.dart' as Constatel;
import 'package:constatel/providers/car_provider.dart';
import 'package:provider/provider.dart';


class ClaimConfirmation extends StatefulWidget {
  const ClaimConfirmation({Key? key}) : super(key: key);

  @override
  State<ClaimConfirmation> createState() => _ClaimConfirmationState();
}

class _ClaimConfirmationState extends State<ClaimConfirmation> {

  late Constatel.AuthProvider authProvider;
  late CarProvider carProvider;
  late Car? _car;
  bool isLoading = true; // Initially set to true to show the loader


  Future<void> fetchUserCars() async {
    authProvider = Provider.of<Constatel.AuthProvider>(context, listen: false);
    carProvider = Provider.of<CarProvider>(context, listen: false);

    try {
      final car = await carProvider.getCarForUser(authProvider.currentUser!.uid);
      setState(() {
        _car = car;
        isLoading = false; // Set isLoading to false when data is loaded
      });
    } catch (e) {
      print('Error fetching user cars: $e');
      isLoading = false; // Set isLoading to false when data is loaded
    }
  }



  @override
  void initState() {
    // Fetch the user's cars and update the _cars list
    isLoading = true;
    fetchUserCars();
  }

  @override
  Widget build(BuildContext context) {
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
                      title: "Etape 5/5: Nouveau constat",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ConstatelText(
                      title: "Confirmation du constat",
                      fontWeight: FontWeight.w500,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 40.0, right: 30.0),
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ConstatelText(
                          title:  "Détails",
                          color: Colors.blueGrey.shade400,
                            fontWeight: FontWeight.bold,
                            size: 20.0,
                        ),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        RowWithText(
                            title: "Numéro constat",
                            content: "CJDJF13R4FFRVRR33"),
                        SizedBox(
                          height: 20.0,
                        ),
                        RowWithText(
                            title: "Date de l'accident",
                            content: "25 Mar 2021, 16:49"),
                        SizedBox(
                          height: 20.0,
                        ),
                        RowWithText(
                            title: "Description de l'accident",
                            content: "Accrochage"),
                        SizedBox(
                          height: 20.0,
                        ),
                        RowWithText(title: "Montant", content: "3000 FCFA"),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  RoundedButton(
                      text: 'Continuer',
                      color: Colors.white,
                      textColor: Colors.black,
                      widthNumber: 0.9,
                      onPressed: () {
                      }),
                ],
              ))
            ],
          ),
        )));
  }
}
