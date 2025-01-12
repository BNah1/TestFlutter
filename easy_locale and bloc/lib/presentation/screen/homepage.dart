import 'package:appscyclonebloc/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("title".tr()),
        actions: [
          InkWell(
            onTap: (){
              context.go('/stream');
            },
            child: Icon(Icons.ac_unit),
          )
        ],),
      body: Center(
      child: Container()
      ),
    );
  }
}
