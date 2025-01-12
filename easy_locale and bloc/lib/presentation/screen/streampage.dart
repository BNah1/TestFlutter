import 'package:appscyclonebloc/bloc/setting/setting_bloc.dart';
import 'package:appscyclonebloc/bloc/setting/setting_event.dart';
import 'package:appscyclonebloc/main.dart';
import 'package:appscyclonebloc/presentation/widget/countdown_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),
        actions: [
          InkWell(
            onTap: (){
              context.push('/screen');
            },
            child: Icon(Icons.ac_unit),
          ),
          SizedBox(width: 30,),
          DropdownButton<Locale>(
              value: context.locale,
              items: const [
                DropdownMenuItem(
                    value: Locale('en','US'),
                    child: Text('English')),
                DropdownMenuItem(
                    value: Locale('vi','VN'),
                    child: Text('Tiếng Việt')),
              ],
              onChanged: (Locale? newLocale){
                if(newLocale != null){
                  context.setLocale(newLocale);
                }
              }),
          SizedBox(width: 30,),

          DropdownButton<ThemeMode>(
            value: ThemeMode.light, // Dùng giá trị mặc định
            onChanged: (ThemeMode? newTheme) {
              if (newTheme != null) {
                // Gửi sự kiện thay đổi theme
                context.read<SettingBloc>().add(ChangeAppTheme(newTheme));
              }
            },
            items: const [
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Light Theme'),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Theme'),
              ),
            ],
          )
        ],
      ),
      body:  Center(
        child: CountdownWidget(),
      ),
    );
  }
}
