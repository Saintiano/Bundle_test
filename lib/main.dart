import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/account/complete_setup.dart';
import 'views/account/create_account.dart';
import 'views/account/intro.dart';
import 'views/account/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bundle Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const Intro(),
    );
  }
}

