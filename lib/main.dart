import 'package:cryptocurrency/utility/route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(
    GetMaterialApp(
      getPages: RoutePage.pages,
      initialRoute: RoutePage.cryptoPage,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}
