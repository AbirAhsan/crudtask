import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomEassyLoading {
  startLoading() async {
    await EasyLoading.show(
        status: "Loading ... ",
        indicator: Image.asset(
          "assets/images/panter.gif",
          width: 100,
          height: 130,
        ));
  }
}
