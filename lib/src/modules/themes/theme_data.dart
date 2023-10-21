import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

class ChatAppTheme {
  ChatAppTheme._();

  static ThemeData lighTheme = ThemeData(
    primaryColor: secondColor,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: secondColor)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: secondColor)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: secondColor)),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: secondColor),
    // appBarTheme: Theme.of(context).appBarTheme.copyWith(color: secondColor),
  );
}
