import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ThemeColors {
  factory ThemeColors() {
    return ThemeColors._instance;
  }

  ThemeColors._create();

  static final ThemeColors _instance = ThemeColors._create();

  final Color transparent = const Color(0x00ffffff);

  final Color black = const Color(0xff000000);

  final Color white = const Color(0xffffffff);

  final ColorSwatch<int> primary = const ColorSwatch<int>(0xff3b82f6, <int, Color>{
    50: Color(0xffeff6ff),
    100: Color(0xffdbeafe),
    200: Color(0xffbfdbfe),
    300: Color(0xff93c5fd),
    400: Color(0xff60a5fa),
    500: Color(0xff3b82f6),
    600: Color(0xff2563eb),
    700: Color(0xff1d4ed8),
    800: Color(0xff1e40af),
    900: Color(0xff1e3a8a),
  });

  final ColorSwatch<int> secondary = const ColorSwatch<int>(0xff6366f1, <int, Color>{
    50: Color(0xffeef2ff),
    100: Color(0xffe0e7ff),
    200: Color(0xffc7d2fe),
    300: Color(0xffc7d2fe),
    400: Color(0xff818cf8),
    500: Color(0xff6366f1),
    600: Color(0xff6366f1),
    700: Color(0xff4338ca),
    800: Color(0xff3730a3),
    900: Color(0xff312e81),
  });

  final ColorSwatch<int> tertiary = const ColorSwatch<int>(0xff06b6d4, <int, Color>{
    50: Color(0xffecfeff),
    100: Color(0xffcffafe),
    200: Color(0xffa5f3fc),
    300: Color(0xffa5f3fc),
    400: Color(0xff22d3ee),
    500: Color(0xff06b6d4),
    600: Color(0xff0891b2),
    700: Color(0xff0e7490),
    800: Color(0xff155e75),
    900: Color(0xff164e63),
  });

  final ColorSwatch<int> alert = const ColorSwatch<int>(0xffef4444, <int, Color>{
    50: Color(0xfffef2f2),
    100: Color(0xfffef2f2),
    200: Color(0xfffecaca),
    300: Color(0xfffca5a5),
    400: Color(0xfff87171),
    500: Color(0xffef4444),
    600: Color(0xffdc2626),
    700: Color(0xffb91c1c),
    800: Color(0xffb91c1c),
    900: Color(0xff7f1d1d),
  });

  final ColorSwatch<int> contrast = const ColorSwatch<int>(0xffeab308, <int, Color>{
    50: Color(0xfffefce8),
    100: Color(0xfffef9c3),
    200: Color(0xfffef08a),
    300: Color(0xfffef08a),
    400: Color(0xfffacc15),
    500: Color(0xffeab308),
    600: Color(0xffca8a04),
    700: Color(0xffca8a04),
    800: Color(0xffa16207),
    900: Color(0xff713f12),
  });

  final ColorSwatch<int> neutral = const ColorSwatch<int>(0xff94a3b8, <int, Color>{
    50: Color(0xfff8fafc),
    100: Color(0xfff1f5f9),
    200: Color(0xffe2e8f0),
    300: Color(0xffe2e8f0),
    400: Color(0xff94a3b8),
    500: Color(0xff94a3b8),
    600: Color(0xff475569),
    700: Color(0xff334155),
    800: Color(0xff1e293b),
    900: Color(0xff0f172a),
  });
}
