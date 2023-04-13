import 'package:flutter/material.dart';
import 'package:constatel/widgets/my_text_button.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';

class DamageScreen extends StatefulWidget {
  const DamageScreen({Key? key}) : super(key: key);

  @override
  State<DamageScreen> createState() => _DamageScreenState();
}

class _DamageScreenState extends State<DamageScreen> {
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
                    title: "Etape 3/5: Nouveau constat",
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ConstatelText(
                      title: "Photos des dégât(s)",
                      fontWeight: FontWeight.w500, size: 25.0
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 3 / 6,
                            height: MediaQuery.of(context).size.height * 3 / 6,
                            child: Image.asset(
                              'assets/images/car.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 180,
                        child: Material(
                          shape: const CircleBorder(
                              side: BorderSide(
                                  width: 5.0, color: Color(0xFFA5CBD9))),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.constatel.blue,
                          elevation: 4.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 300,
                        right: 0,
                        child: Material(
                          shape: const CircleBorder(
                              side: BorderSide(
                                  width: 5.0, color: Color(0xFFA5CBD9))),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.constatel.blue,
                          elevation: 4.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        left: 0,
                        child: Material(
                          shape: const CircleBorder(
                              side: BorderSide(width: 5.0, color: Color(0xFFA5CBD9))),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.constatel.blue,
                          elevation: 4.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 180,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:  Material(
                            shape: const CircleBorder(
                                side: BorderSide(
                                    width: 5.0, color: Color(0xFFA5CBD9))),
                            clipBehavior: Clip.antiAlias,
                            color: AppColors.constatel.blue,
                            elevation: 4.0,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, right: 30.0),
                  child: MyTextButton(
                    backgroundColor: Colors.black87,
                    buttonName: 'Suivant',
                    onTap: () {
                      Navigator.pushNamed(context, 'claim');
                    },
                  ),
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
