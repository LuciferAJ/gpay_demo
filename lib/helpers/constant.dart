import 'package:flutter/material.dart';

class Constants {
  static final appColors = _AppColors();
  static final urls = _URLS();
  static final pin = _Pin();
}

class _AppColors {
  final Color appBackgroundColor = const Color(0xff1A73E8);
  final Color primaryColor = const Color(0xff1B317D);
  final Color white = Colors.white;
  final Color offWhite = const Color(0xffF1F1F1);
  final Color secondaryColor = const Color(0xffCFCFCF);
}

class _URLS {
  final String sender =
      "https://images.squarespace-cdn.com/content/v1/5446f93de4b0a3452dfaf5b0/1626904421257-T6I5V5IQ4GI2SJ8EU82M/Above+Avalon+Neil+Cybart";
  final String reciever =
      "https://play-lh.googleusercontent.com/5ZxVI65M9_yQQHgsY2f_lvSFD9E4Oqvfgxkg-E-MZwWt1M65-6HLY3twREAubQtZqqo";
  final String upiLogo = "https://logodix.com/logo/1645140.png";
}

class _Pin {
  final int pinLength = 4;
}
