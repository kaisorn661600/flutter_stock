

import 'package:flutter/material.dart';

class BackGroundTheme{
  const BackGroundTheme();
  static const _gradientStart = const Color(0XFFffffff);
  static const _gradientEnd = const Color(0XFFDC281E);

  get gradientStart => _gradientStart;
  get gradientEnd => _gradientEnd;


  static const gradient = LinearGradient(
      colors: [
        //Colors.white,
        _gradientStart,
        _gradientEnd,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 1.0],
  );
}