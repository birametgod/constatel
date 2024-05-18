import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';
import 'package:constatel/screens/take_picture_screen.dart';
import 'package:camera/camera.dart';
import 'package:constatel/widgets/rounded_button.dart';


class DamageScreen extends StatefulWidget {
  const DamageScreen({Key? key}) : super(key: key);

  @override
  State<DamageScreen> createState() => _DamageScreenState();
}

class _DamageScreenState extends State<DamageScreen> {
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
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: ConstatelText(
                    title: "Etape 3/5: Nouveau constat",
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: ConstatelText(
                      title: "Photos des dégât(s)",
                      fontWeight: FontWeight.w500, size: 25.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
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
                              onPressed: () async {
                                final cameras = await availableCameras();

                                // Get a specific camera from the list of available cameras.
                                final firstCamera = cameras.first;

                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TakePictureScreen(
                                      camera: firstCamera,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
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
                            icon: const Icon(
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
                            icon: const Icon(
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
                              icon: const Icon(
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
                const SizedBox(height: 15.0),
                RoundedButton(
                    text: 'Continuer',
                    color: Colors.white,
                    textColor: Colors.black,
                    widthNumber: 0.9,
                    onPressed: () {
                      Navigator.pushNamed(context, 'confirmation');
                    } ),
              ],
            ))
          ],
        ),
      )),
    );
  }

  _DamageScreenState();
}
