import 'dart:ui';

import 'package:flutter/material.dart';

abstract class SettingEvent{}

class SwitchLocale extends SettingEvent{
  final Locale locale;
  SwitchLocale(this.locale);
}

class SwitchTheme extends SettingEvent{
  final ThemeMode themeMode;
  SwitchTheme(this.themeMode);
}