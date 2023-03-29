import 'package:flutter/material.dart';
import 'package:login_screen/constants.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final TextInputType textInputType;
  final bool isPasswordField;
  final String hintText;
  final ScrollController scrollController;

  const InputField({
    super.key,
    required this.icon,
    required this.textInputType,
    this.isPasswordField = false,
    required this.hintText,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(
            icon,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
          child: TextField(
            keyboardType: textInputType,
            obscureText: isPasswordField,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
            ),
            onTap: () {
              scrollController.animateTo(
                MediaQuery.of(context).size.height,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        )
      ],
    );
  }
}
