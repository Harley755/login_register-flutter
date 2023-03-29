import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Expanded buildSvpPicture(isInSignInScreen) {
  return Expanded(
    flex: 1,
    child: isInSignInScreen
        ? Container(
            padding: const EdgeInsets.all(0.0),
            child: SvgPicture.asset('assets/login.svg'),
          )
        : Container(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset('assets/register.svg'),
          ),
  );
}
