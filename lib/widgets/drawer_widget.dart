import 'dart:math';

import 'package:cars_ui_challenge/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  double _rotationAngle = 0.0;
  bool _isRotated = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _rotateBlacksImage() {
    setState(() {
      _isRotated = !_isRotated;
      _rotationAngle = _isRotated ? pi / 2 : 0.0;
      _selectedIndex = 0; // Reset selected index when rotating blacks image
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.2,
      width: size.width * 0.16,
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.drawerColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.elliptical(100, 60),
          bottomRight: Radius.elliptical(100, 60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          GestureDetector(
            onTap: _rotateBlacksImage,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAngle * _fadeAnimation.value,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset(
                      "assets/images/blacks.png",
                      width: 35,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          if (!_isRotated)
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(0.5, 1.0), // Delay fade in animation
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 4.5,
                  ),
                  Icon(
                    Icons.arrow_upward,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Tap to open',
                      style: Theme.of(context).appTextTheme.h2,
                    ),
                  ),
                ],
              ),
            ),
          if (_isRotated)
            Column(
              children: [
                Image.asset(
                  "assets/images/badge.png",
                  height: 120,
                  width: 240,
                ),
                const SizedBox(height: 30),
                buildButton(0, "My Profile", context),
                const SizedBox(height: 40),
                buildButton(1, "Notification", context),
                const SizedBox(height: 40),
                buildButton(2, "Invoice", context),
                const SizedBox(height: 40),
                buildButton(3, "Home", context),
              ],
            ),
          const SizedBox(height: 60),
          if (_isRotated)
            Icon(
              Icons.shopping_bag_outlined,
              size: 28,
              color: Theme.of(context).appColors.onPrimary,
            ),
        ],
      ),
    );
  }

  Widget buildButton(int index, String title, BuildContext context) {
    final selected = _selectedIndex == index || (!_isRotated && index == 0);

    return RotatedBox(
      quarterTurns: 3,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          _animationController.reset();
          _animationController.forward();
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (selected)
              Positioned(
                left: -20,
                right: -20,
                top: -30,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + (0.2 * _fadeAnimation.value),
                      child: Container(
                        width: 300,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Theme.of(context).appColors.drawerColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.elliptical(80, 100),
                            bottomRight: Radius.elliptical(80, 100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 60,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontFamily: "Arcane",
                fontSize: selected ? 17 : 15,
                letterSpacing: 1.2,
                color: Theme.of(context).appColors.onSurface,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w600,
              ),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
