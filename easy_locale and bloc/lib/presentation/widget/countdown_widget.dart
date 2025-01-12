import 'dart:async';

import 'package:appscyclonebloc/bloc/setting/setting_bloc.dart';
import 'package:appscyclonebloc/bloc/setting/setting_state.dart';
import 'package:appscyclonebloc/main.dart';
import 'package:appscyclonebloc/presentation/widget/customtextbutton.dart';
import 'package:appscyclonebloc/utils/stream.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late MyStream streamTest;
  @override
  void initState() {
    streamTest = context.read<SettingBloc>().countdownClock;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      StreamBuilder(
          stream: streamTest.stream,
          builder: (BuildContext context, snapshot){
            if (snapshot.hasData) {
              int totalSeconds = snapshot.data!;
              int minutes = totalSeconds ~/ 60;
              int seconds = totalSeconds % 60;
              String formattedMinutes = minutes.toString().padLeft(2, '0');
              String formattedSeconds = seconds.toString().padLeft(2, '0');
              return Container(
                child: Text( snapshot.data !=0 ?
                '$formattedMinutes:$formattedSeconds'
                    : "end".tr()
                  , // MM:SS
                  style: const TextStyle(fontSize: 60, ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
      ComboButtonCountdown(streamTest)
    ],);
  }
}
