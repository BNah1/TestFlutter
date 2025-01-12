import 'package:appscyclonebloc/utils/stream.dart';
import 'package:flutter/material.dart';

abstract class SettingState {}


class SettingInitial extends SettingState{}

class ThemeChanged extends SettingState {
  final ThemeMode theme;

  ThemeChanged(this.theme);
}

class LocaleChanged extends SettingState {
  final Locale localization;

  LocaleChanged(this.localization);
}

class SettingError extends SettingState{
  final String message;
  SettingError(this.message);
}