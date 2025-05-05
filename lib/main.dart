import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/home_controller.dart';
import 'package:getx_flutter_demo/view/home.dart';
import 'package:getx_flutter_demo/view/test.dart';

void main() {
  Get.put(HomeController()); // Put it here ONCE
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
      getPages: [
        GetPage(name: '/home', page: () => MyHomePage()),
        GetPage(name: '/test', page: () => Test()),
      ],
    );
  }
}
