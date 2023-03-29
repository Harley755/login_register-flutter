import 'package:flutter/material.dart';
import 'package:login_screen/constants.dart';
import 'package:login_screen/screens/login_screen.dart';

class StateConnexion extends StatefulWidget {
  final LoginScreen loginS;
  const StateConnexion({super.key, required this.loginS});

  @override
  State<StateConnexion> createState() => _StateConnexionState();
}

class _StateConnexionState extends State<StateConnexion> {
  bool _isInSignInScreen = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => setState(() {
            print(widget.loginS);
            // print(_isInSignInScreen);
          }),
          child: Text(
            'Sign in'.toUpperCase(),
            style: _isInSignInScreen
                ? Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: kPrimaryColor)
                : const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            _isInSignInScreen = false;
            print(_isInSignInScreen);
          }),
          child: Text(
            'Sign up'.toUpperCase(),
            style: !_isInSignInScreen
                ? Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: kPrimaryColor)
                : const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
      ],
    );
  }
}
