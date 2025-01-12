import 'package:appscyclonebloc/bloc/setting/setting_bloc.dart';
import 'package:appscyclonebloc/bloc/setting/setting_event.dart';
import 'package:appscyclonebloc/bloc/setting/setting_state.dart';
import 'package:appscyclonebloc/core/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale('en', 'US'), // Tiếng Anh
        Locale('vi', 'VN'), // Tiếng Việt
      ],
      fallbackLocale: const Locale('vi', 'VN'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingBloc()),
      ],
      child: BlocBuilder<SettingBloc,SettingState>(
        builder: (context, state){
          ThemeMode themeMode = ThemeMode.light;
          if(state is ThemeChanged){
            themeMode = state.theme;
          }
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: route,
            title: 'Flutter Demo',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeMode,
          );
        },
      )
    );
  }
}
