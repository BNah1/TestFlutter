import 'package:appscyclonebloc/bloc/setting/setting_bloc.dart';
import 'package:appscyclonebloc/bloc/setting/setting_state.dart';
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
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context , state){
          // Locale mặc định (sử dụng context.locale để lấy locale hiện tại)
          Locale currentLocale = context.locale;

          // Nếu có sự thay đổi locale từ state của bloc
          if (state is LocaleChanged) {
            currentLocale = state.localization;  // Cập nhật locale từ state
          }
          return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: currentLocale,
              routerConfig: route,
              title: 'Flutter Demo',
              theme: ThemeData());
        },
      ),
    );
  }
}
