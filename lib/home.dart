import 'package:cars_ui_challenge/car_details_screen.dart';
import 'package:cars_ui_challenge/utils/app_theme.dart';
import 'package:cars_ui_challenge/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/cards_widget.dart';
import 'widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double topPosition = size.height * 0.19;
    final double leftPosition = size.width * 0.23;
    final double topPosition2 = size.height * 0.46;
    final double leftPosition2 = size.width * 0.20;
    final double topPosition3 = size.height * 0.66;
    final double leftPosition3 = size.width * 0.22;
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.background,
      body: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height, // Set the height of the container
        width:
            MediaQuery.of(context).size.width, // Set the width of the container
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButtonGroup(
                      buttonLabels: ['Hot', 'American', 'French', 'Mexico'],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const CustomCard(
                            text: 'Bufori',
                            bodyText:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomCard(
                            text: '1950s thunderbird',
                            bodyText:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const CarDetailsScreen(),
                                  transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                ),
                              );
                            },
                            child: const CustomCard(
                              text: 'Bugatti',
                              bodyText:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
              top: 80,
              left: 0,
              bottom: 20,
              child: MyDrawer(),
            ),
            Positioned(
              top: topPosition,
              left: leftPosition,
              child: Image.asset(
                'assets/images/car1.png',
                fit: BoxFit.fitWidth,
                width: size.width / 1.8,
              ),
            ),
            Positioned(
              top: topPosition2,
              left: leftPosition2,
              child: Image.asset(
                'assets/images/car2.png',
                fit: BoxFit.fitWidth,
                width: size.width / 1.6,
              ),
            ),
            Positioned(
              top: topPosition3,
              left: leftPosition3,
              child: Hero(
                tag: 'car3',
                child: Image.asset(
                  'assets/images/car4.png',
                  fit: BoxFit.fitWidth,
                  width: size.width / 1.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
