import 'dart:ui';

import 'package:appscyclonebloc/bloc/setting/setting_event.dart';
import 'package:appscyclonebloc/bloc/setting/setting_state.dart';
import 'package:appscyclonebloc/utils/stream.dart';
import 'package:bloc/bloc.dart';

class SettingBloc extends Bloc<SettingEvent,SettingState>{
  final MyStream countdownClock;
  SettingBloc() : countdownClock = MyStream(100), super(SettingInitial()) {

    on<SwitchLocale>((event, emit){
      emit(LocaleChanged(event.locale));
    });

    on<SwitchTheme>((event, emit){
      emit(ThemeChanged(event.themeMode));
    });

  }
}