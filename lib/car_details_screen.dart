import 'package:cars_ui_challenge/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).appColors.onBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: size.height / 1.2,
                    width: size.width / 1.1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      color: Theme.of(context).appColors.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Score",
                            style: Theme.of(context).appTextTheme.body1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset("assets/images/stars.svg"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum Dolor Sit sequDol Esse Cillum Dol Eu Fugiat Nulla Pariatur Excepteur Sint",
                            style: Theme.of(context)
                                .appTextTheme
                                .body3
                                .copyWith(
                                  color: Theme.of(context).appColors.surface,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: size.height / 1.5,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        color: Theme.of(context).appColors.error,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                              right: 30,
                              bottom: 80,
                            ),
                            child: Text(
                              "Lorem Ipsum Dolor Sit sequDolor In Reprehenderit In Voluptate Velit Esse Cillum Dolore Eu Fugiat Nulla Pariatur Excepteur Sint t Mollit Anim Id Est Laborum",
                              style: Theme.of(context)
                                  .appTextTheme
                                  .body3
                                  .copyWith(
                                    color:
                                        Theme.of(context).appColors.onSurface,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: -50,
                        left: 10,
                        child: Image.asset(
                          'assets/images/car5.png',
                          fit: BoxFit.contain,
                          width: size.width / 2,
                        )),
                    Positioned(
                        bottom: -50,
                        right: -10,
                        child: Image.asset(
                          'assets/images/certify.png',
                          fit: BoxFit.contain,
                          width: size.width / 3,
                        )),
                  ]),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: size.height / 2,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        color: Theme.of(context).appColors.onError,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Bugatti",
                            style: Theme.of(context).appTextTheme.h2,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 70,
                      child: Image.asset(
                        'assets/images/badge.png',
                        fit: BoxFit.contain,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: -40,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      right: -40,
                      left: -120,
                      bottom: 30,
                      top: 0,
                      child: Hero(
                        tag: "car3",
                        child: Image.asset(
                          'assets/images/car4.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
