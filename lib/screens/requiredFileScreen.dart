import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';
import 'package:constatel/widgets/constatel_list_tile.dart';

class RequiredFileScreen extends StatefulWidget {
  const RequiredFileScreen({Key? key}) : super(key: key);

  @override
  State<RequiredFileScreen> createState() => _RequiredFileScreenState();
}

class _RequiredFileScreenState extends State<RequiredFileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
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
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: ConstatelText(
                      title: "Etape 1/5: Nouveau constat",
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5.0,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: ConstatelText(
                      title: "Fichiers Requis",
                      fontWeight: FontWeight.w500,
                      size: 25.0)),
              Expanded(child:  Container(
                margin: EdgeInsets.only(top: 40.0, right: 10.0, bottom: 50.0),
                padding: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 9,
                          spreadRadius: 2,
                          offset: Offset(1, 1))
                    ]),
                child: Column(
                  children: [
                    ConstatelListTile(title: "Carte d'identité", subtitle: "Scanne ou tape ton numéro d'identification", iconData:  Icons.person,),
                    SizedBox(
                      height: 25.0,
                    ),
                    ConstatelListTile(title: "Plaque d'immatriculation", subtitle: "Scanne ou tape ton numéro d'immatriculation", iconData:  Icons.abc,),
                    SizedBox(
                      height: 25.0,
                    ),
                    ConstatelListTile(title: "Photos des dégâts", subtitle: "Maximum 4 photos", iconData:  Icons.image,),
                    SizedBox(
                      height: 25.0,
                    ),
                    ConstatelListTile(title: "Numéro de téléphone", subtitle: "Requis pour la réception du rapport d'accident", iconData: Icons.phone_android_sharp,),
                    SizedBox(
                      height: 25.0,
                    ),
                    ConstatelListTile(title: "Email", subtitle: "Requis pour la réception du rapport d'accident", iconData:  Icons.alternate_email,),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 10.0, right: 10.0),
                      child: MyTextButton(
                        backgroundColor: Colors.black87,
                        buttonName: 'Suivant',
                        onTap: () {
                          Navigator.pushNamed(context, 'info');
                        },
                      ),
                    )
                  ],
                ),
              ),)
            ],
          ),
        )));
  }
}
