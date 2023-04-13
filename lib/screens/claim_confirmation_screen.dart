import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/row_with_text.dart';
import 'package:constatel/widgets/constatel_text.dart';

class ClaimConfirmation extends StatefulWidget {
  const ClaimConfirmation({Key? key}) : super(key: key);

  @override
  State<ClaimConfirmation> createState() => _ClaimConfirmationState();
}

class _ClaimConfirmationState extends State<ClaimConfirmation> {
  @override
  Widget build(BuildContext context) {
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
                      title: "Etape 5/5: Nouveau constat",
                      color: Colors.grey,
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
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0, right: 30.0),
                    child: MyTextButton(
                      backgroundColor: Colors.black87,
                      buttonName: 'Confirmer',
                      onTap: () {},
                    ),
                  )
                ],
              ))
            ],
          ),
        )));
  }
}
