import 'package:cars_ui_challenge/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String text;
  final String bodyText;

  const CustomCard({
    Key? key,
    required this.text,
    required this.bodyText,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

bool isFavorite = false;

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height / 5,
          width: size.width / 1.5,
          child: Card(
            color: Theme.of(context).appColors.primary,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).appTextTheme.h1.copyWith(
                            color: Theme.of(context).appColors.surface,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.bodyText,
                      style: Theme.of(context).appTextTheme.body3.copyWith(
                            color: Theme.of(context).appColors.surface,
                          ),
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          right: 6,
          top: 6,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.secondary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: const Icon(
                Icons.favorite,
                size: 18,
              ),
              color: isFavorite ? Colors.red : Colors.grey[300],
              splashColor: Colors.transparent,
              splashRadius: 1,
            ),
          ),
        ),
      ],
    );
  }
}
