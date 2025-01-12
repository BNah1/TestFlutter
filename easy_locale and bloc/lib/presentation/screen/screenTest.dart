import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/countdown_widget.dart';

class Screentest extends StatelessWidget {
  const Screentest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title".tr()),
        actions: [
          InkWell(
            onTap: (){
              context.pop();
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
              })
        ],
      ),
      body: Center(child: CountdownWidget(),),
    );
  }
}
