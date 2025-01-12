import 'dart:ui';

import 'package:flutter/material.dart';

abstract class SettingEvent{}

class SwitchLocale extends SettingEvent{
  final Locale locale;
  SwitchLocale(this.locale);
}

class ChangeAppTheme  extends SettingEvent{
  final ThemeMode themeMode;
  ChangeAppTheme (this.themeMode);
}