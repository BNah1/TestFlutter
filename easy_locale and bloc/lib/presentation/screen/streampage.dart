import 'package:appscyclonebloc/presentation/widget/countdown_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/setting/setting_bloc.dart';
import '../../bloc/setting/setting_event.dart';

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
                  context.read<SettingBloc>().add(SwitchLocale(newLocale));
                }
                context.setLocale(newLocale!);

              })
        ],
      ),
      body: const Center(
        child: CountdownWidget(),
      ),
    );
  }
}
