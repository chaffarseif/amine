import 'package:ds_mobile/tache/affichage.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          elevation: 8,
          shape: const CircleBorder(),
          minimumSize: const Size.square(60),
        ))),
    home: const affichage(),
  ));
}
