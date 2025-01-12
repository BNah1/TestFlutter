import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('title'.tr());
  }
}
