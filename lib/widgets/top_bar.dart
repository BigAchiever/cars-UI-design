import 'package:cars_ui_challenge/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextButtonGroup extends StatefulWidget {
  final List<String> buttonLabels;

  const CustomTextButtonGroup({Key? key, required this.buttonLabels})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextButtonGroupState createState() => _CustomTextButtonGroupState();
}

class _CustomTextButtonGroupState extends State<CustomTextButtonGroup> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.buttonLabels.length, (index) {
        return TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _selectedButtonIndex == index
                  ? Theme.of(context).appColors.primary
                  : Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              _selectedButtonIndex = index;
            });
          },
          child: Text(
            widget.buttonLabels[index],
            style: Theme.of(context).appTextTheme.body2.copyWith(
                  color: _selectedButtonIndex == index
                      ? Theme.of(context).appColors.surface
                      : Theme.of(context).appColors.onSurface,
                ),
          ),
        );
      }),
    );
  }
}
