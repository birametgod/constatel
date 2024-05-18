import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/widgets/constatel_list_tile.dart';
import 'package:constatel/widgets/rounded_button.dart';

class RequiredFileScreen extends StatefulWidget {
  const RequiredFileScreen({Key? key}) : super(key: key);

  @override
  State<RequiredFileScreen> createState() => _RequiredFileScreenState();
}

class _RequiredFileScreenState extends State<RequiredFileScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xff3c4372),
        appBar: AppBar(
          backgroundColor: const Color(0xff3c4372),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: ConstatelText(
                          title: "Etape 1/5: Nouveau constat",
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: ConstatelText(
                          title: "Fichiers Requis",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          size: 25.0)),
                ],
              ),
              const Column(
                children: [
                  ConstatelListTile(
                    title: "Carte d'identité",
                    subtitle: "Scanne ou tape ton numéro d'identification",
                    iconData: Icons.person,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ConstatelListTile(
                    title: "Plaque d'immatriculation",
                    subtitle: "Scanne ou tape ton numéro d'immatriculation",
                    iconData: Icons.abc,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ConstatelListTile(
                    title: "Photos des dégâts",
                    subtitle: "Maximum 4 photos",
                    iconData: Icons.image,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ConstatelListTile(
                    title: "Numéro de téléphone",
                    subtitle: "Requis pour la réception du rapport d'accident",
                    iconData: Icons.phone_android_sharp,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ConstatelListTile(
                    title: "Email",
                    subtitle:
                        "Requis pour la réception du rapport d'accident",
                    iconData: Icons.alternate_email,
                  ),
                ],
              ),
              RoundedButton(
                  text: 'Continuer',
                  color: Colors.white,
                  textColor: Colors.black,
                  widthNumber: 0.9,
                  onPressed: () {
                    Navigator.pushNamed(context, 'info');
                  }),
            ],
          ),
        )));
  }
}
