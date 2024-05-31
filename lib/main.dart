import 'package:flutter/material.dart';
import 'package:flutter1/GestureDetector.dart';
import 'package:flutter1/cardListTile.dart';
import 'package:flutter1/customScrollView.dart';
import 'package:flutter1/gridViewKullanimi.dart';
import 'package:flutter1/listView.dart';
import 'package:flutter1/listViewBuilder.dart';
import 'package:flutter1/silverListBuilder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {    // bu şekil paketimizdeki degerleri default ayarlayabiliriz
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      builder: EasyLoading.init(),
      home: Silverlistbuilder(),
    );
  }
}
