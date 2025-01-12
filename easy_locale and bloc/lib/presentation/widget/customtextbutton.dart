import 'package:appscyclonebloc/utils/stream.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget ComboButtonCountdown(MyStream stream) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CusTextButton("button_Pause".tr(), () {
        stream.onPause();
      }),
      CusTextButton("button_Resume".tr(), () {
        stream.onResume();
      }),
      CusTextButton("button_Reset".tr(), () {
        stream.onReset();
      }),
    ],
  );
}

Widget CusTextButton(String name, VoidCallback tap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: TextButton(
      onPressed: tap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        // Thêm padding
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
